import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../repositories/table_keys.dart';

class Message {

  String? id;
  String? chatHomeId;
  String? text;
  String? destinationId;
  DateTime? sendDate;

  Message({
    required this.id,
    required this.chatHomeId,
    required this.text,
    required this.destinationId,
    required this.sendDate,
  });

  Message.fromParse(ParseObject parseObject) {
    id = parseObject.objectId;
    chatHomeId = parseObject.get<ParseObject>(keyMessageChatHome)?.objectId;
    text = parseObject.get<String>(keyMessageText);
    sendDate = parseObject.get<DateTime>(keyMessageDateSend);
    destinationId = parseObject.get<String>(keyMessageDestinationId);
  }
}