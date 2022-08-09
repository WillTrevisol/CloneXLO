import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/chat_home.dart';
import '../models/messages.dart';
import '../models/user.dart';
import 'parse_errors.dart';
import 'table_keys.dart';

class MessageRepository {

  final LiveQuery _liveQuery = LiveQuery();
  late Subscription? _subscription;

  QueryBuilder getQuery(String chatHomeId) => 
    QueryBuilder<ParseObject>(ParseObject(keyMessageTable))
      ..whereEqualTo(
        keyMessageChatHome, 
        (ParseObject(keyChatHomeTable)..set(keyChatHomeId, chatHomeId))
          .toPointer())
      ..orderByDescending(keyMessageDateSend);

  Future<List<Message>?> getMessagesList(ChatHome chat) async {
    try {
      final response = await getQuery(chat.id!).query();

      if (response.success && response.results != null) {
        return response.results!.map((e) => Message.fromParse(e)).toList();
      }

      if (response.success && response.results == null) {
        return [];
      }

      return Future.error('${ParseErrors.getDescription(response.error?.code ?? -1)}');
    } catch (e) {
      return Future.error('Falha ao obter mensagens');
    }
  }

  Future<void> liveMessageList({required ChatHome chat, required Function onNewMessage}) async {
    _subscription = await _liveQuery.client.subscribe(getQuery(chat.id!));

    if (_subscription != null) {
      _subscription!.on(LiveQueryEvent.create, (object) {
        onNewMessage(Message.fromParse(object));
      });
    }
  }

  Future<Message?> saveMessage({
    required ChatHome chat, 
    required String textMessage,
    required List<User> users,
    required User destination,
  }) async {
    try {
      final messageObject = ParseObject(keyMessageTable);

      List<ParseUser> usersList = users
        .map((user) => ParseUser(null, null, null)..objectId = user.id)
        .toList();
      
      final parseAcl = ParseACL();
      for (final user in usersList) {
        parseAcl
          ..setReadAccess(userId: user.objectId!)
          ..setWriteAccess(userId: user.objectId!);
      }

      messageObject..set(
        keyMessageChatHome, 
        ParseObject(keyChatHomeTable)
          ..set(keyChatHomeId, chat.id))
          ..setACL(parseAcl)
          ..set(keyMessageDestinationId, destination.id)
          ..set(keyMessageText, textMessage);

      final response = await messageObject.save();

      if (!response.success) {
        return Future.error('${ParseErrors.getDescription(response.error?.code ?? -1)}');
      }

      return Message.fromParse(response.results?.first);
    } catch (e) {
      return Future.error('Falha ao enviar mensagem');
    }
  }

  void cancelLiveQuery() {
    if (_subscription != null) {
      _liveQuery.client.unSubscribe(_subscription!);
    }

    _subscription = null;
  }
}