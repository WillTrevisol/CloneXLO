import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../stores/chat_home_store.dart';
import '../../widgets/drawer/custom_drawer.dart';
import '../../widgets/empty_card.dart';
import 'widgets/chat_tile.dart';

class ChatHomeScreen extends StatelessWidget {
  ChatHomeScreen({Key? key}) : super(key: key);

  final ChatHomeStore controller = GetIt.I.get<ChatHomeStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text('Chats'),
        ),
        body: Observer(
          builder: (_) {
            if (controller.chatHomeList.isEmpty) {
              return const EmptyCard(
                message: 'Nenhum chat ativo encontrado',
              );
            }

            return ListView.builder(
              itemCount: controller.chatHomeList.length,
              itemBuilder: (context, index) {
                return ChatTile(
                  chat: controller.chatHomeList[index],
                );
              }
            ); 
          },
        ),
      ),
    );
  }
}