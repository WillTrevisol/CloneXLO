import 'package:clone_xlo_flutter/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../models/messages.dart';
import '../../../stores/user_manager_store.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({required this.message, Key? key}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: Align(
        alignment: isDestination() ? Alignment.topLeft : Alignment.topRight,
        child: Column(
          crossAxisAlignment: isDestination() 
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
          children: <Widget> [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isDestination() ? Colors.orange : Colors.purple,
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                message.text ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(message.sendDate!.toLocal().formatedDate()),
            )
          ],
        ),
      ),
    );
  }

  bool isDestination() => GetIt.I.get<UserManagerStore>().user!.id == message.destinationId;
}