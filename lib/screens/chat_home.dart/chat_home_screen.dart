import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../widgets/drawer/custom_drawer.dart';
import '../../widgets/empty_card.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

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
            return const EmptyCard(
              message: 'Nenhum chat ativo encontrado',
            );
          },
        ),
      ),
    );
  }
}