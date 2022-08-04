import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../repositories/table_keys.dart';
import '../repositories/user_repository.dart';
import 'ad.dart';
import 'user.dart';

class ChatHome {

  String? id;
  Ad? ad;
  String? lastMessageSent;
  DateTime? lastDateTimeMessage;
  List<User>? users;

  ChatHome({
    required this.id,
    required this.ad,
    required this.lastMessageSent,
    required this.lastDateTimeMessage,
    required this.users  
  });

  ChatHome.fromParse(ParseObject parseObject) {
    id = parseObject.objectId;
    ad = Ad.fromParse(parseObject.get<ParseObject>(keyChatHomeAd)!);
    lastMessageSent = parseObject.get<String>(keyChatHomeLastMessage, defaultValue: '');
    lastDateTimeMessage = parseObject.get<DateTime>(keyChatHomeLastDateMessage);
    users = parseObject.get<List<dynamic>>(keyChatHomeUsers)!
      .map((user) => UserRepository().parseToUser(user))
      .toList();
  }

}