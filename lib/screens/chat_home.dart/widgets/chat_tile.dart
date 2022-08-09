import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_xlo_flutter/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../models/ad.dart';
import '../../../models/chat_home.dart';
import '../../../stores/chat_home_store.dart';
import '../../messages/messages_screen.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({required this.chat, Key? key}) : super(key: key);

  final ChatHome chat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GetIt.I.get<ChatHomeStore>().setChatHome(chat);

        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const MessageScreen())
        );
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Card(
          child: Row(
            children: <Widget> [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 135,
                  width: 127,
                  child: chat.ad!.images.isEmpty ? Image.asset('assets/images/no-image.jpeg') : CachedNetworkImage(
                    imageUrl: chat.ad!.images.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Text(
                        chat.ad!.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        chat.ad!.description,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        chat.lastMessageSent ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      chat.lastDateTimeMessage!.toLocal().formatedDate(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (chat.ad!.adStatus!.index > AdStatus.sold.index)
                      Text(
                        '${chat.ad!.adStatus!.statusDescription}',
                        textAlign: TextAlign.center,
                      )
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}