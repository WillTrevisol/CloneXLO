import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/ad.dart';
import '../models/chat_home.dart';
import '../models/user.dart';
import 'parse_errors.dart';
import 'table_keys.dart';

class ChatHomeRepository {

  final LiveQuery _liveQuery = LiveQuery();
  late Subscription? _subscription;

  QueryBuilder getQuery(User user) => 
    QueryBuilder<ParseObject>(ParseObject(keyChatHomeTable))
      ..includeObject(
        [keyChatHomeId, keyChatHomeUsers, '$keyChatHomeAd.$keyAdOwner'])
      ..orderByDescending(keyChatHomeLastDateMessage);

  Future<List<ChatHome>?> getChatHomeList(User user) async {
    try {
      final response = await getQuery(user).query();

      if (response.success && response.results != null) {
        return response.results!.map((chats) => ChatHome.fromParse(chats)).toList();
      }

      if (response.success && response.results == null) {
        return [];
      }

      return Future.error('${ParseErrors.getDescription(response.error?.code ?? -1)}');
    } catch (e) {
      return Future.error('Falha ao obter lista de chat');
    }
  }

  Future<ChatHome?> getChatHomeById(String id) async {
    try {
      final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyChatHomeTable))
        ..includeObject(
          [keyChatHomeAd, keyChatHomeUsers, '$keyChatHomeId.$keyAdOwner'])
        ..whereEqualTo(keyChatHomeId, id);

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        return ChatHome.fromParse(response.results?.first);
      }

      if (response.success && response.results == null) {
        return null;
      }

      return Future.error('${ParseErrors.getDescription(response.error?.code ?? -1)}');
    } catch (e) {
      return Future.error('Falha ao obter chat');
    }
  }

  Future<ChatHome?> createChatHome({required Ad ad, required List<User> users}) async {
    ParseResponse? response;

    try {
      final chatHomeObject = ParseObject(keyChatHomeTable);

      List<ParseUser> usersList = users.map(
        (user) => ParseUser(null, null, null)..objectId = user.id)
        .toList();
      
      final parseAcl = ParseACL();
      for (final user in usersList) {
        parseAcl
          ..setWriteAccess(userId: user.objectId!)
          ..setReadAccess(userId: user.objectId!);
      }

      chatHomeObject
        ..setACL<ParseACL>(parseAcl)
        ..set<List<ParseUser>>(keyChatHomeUsers, usersList)
        ..set<ParseObject>(keyChatHomeAd, 
          ParseObject(keyAdTable)
            ..set(keyAdId, ad.id));
      
      response = await chatHomeObject.save();

      if (!response.success) {
        return Future.error('${ParseErrors.getDescription(response.error?.code ?? -1)}');
      }

      return await getChatHomeById((response.results?.first as ParseObject).objectId!);
    } catch (e) {
      return Future.error('${ParseErrors.getDescription(response?.error?.code ?? -1)}');
    }
  }

  Future<void> liveChatHomeList({required User user, required Function onChanged}) async {
    _subscription = await _liveQuery.client.subscribe(getQuery(user));

    if (_subscription != null) {
      _subscription?.on(LiveQueryEvent.create, (object) {
        onChanged();
      });

      _subscription?.on(LiveQueryEvent.update, (object) {
        onChanged();
      });

      _subscription?.on(LiveQueryEvent.delete, (object) {
        onChanged();
      });
    }
  }

  Future<void> deleteChatHome(ChatHome chatHome) async {
    try {
      final chatHomeObject = ParseObject(keyChatHomeTable);

      chatHomeObject.objectId = chatHome.id;

      final response = await chatHomeObject.delete();

      if (!response.success) {
        return Future.error('${ParseErrors.getDescription(response.error?.code ?? -1)}');
      }
    } catch (e) {
      return Future.error('Falha ao deletar chat');
    }
  }

  void cancelLiveQuery() {
    if (_subscription != null) {
      _liveQuery.client.unSubscribe(_subscription!);
    }

    _subscription = null;
  }
}