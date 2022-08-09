import 'dart:io';

import 'package:clone_xlo_flutter/helpers/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../models/ad.dart';
import '../../stores/chat_home_store.dart';
import '../../stores/message_store.dart';
import '../../stores/user_manager_store.dart';
import 'widgets/adtile_message.dart';
import 'widgets/message_textfield.dart';
import 'widgets/message_tile.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  final user = GetIt.I.get<UserManagerStore>().user;
  final ScrollController scrollController = ScrollController();
  final MessageStore messageController = MessageStore();
  final ChatHomeStore chatController = GetIt.I.get<ChatHomeStore>();

  @override
  void initState() {
    reaction(
      (_) => messageController.messagesList, 
      (message) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                0.0, 
                duration: const Duration(milliseconds: 300), 
                curve: Curves.easeOut,
              );
            }
          }
        );
      }
    );
    super.initState();
  }

  @override
  void dispose() {
    messageController.cancelLive();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(chatController.ad?.title ?? 'Chat'),
          actions: <Widget> [
            PopupMenuButton(
              itemBuilder: (BuildContext context) => [  
                const PopupMenuItem(value: 0, child: Text('Ver perfil')),
                const PopupMenuItem(value: 1, child: Text('Excluir'))
              ],
              onSelected: (choice) {
                if (choice == 0) {
                  showProfile(context);
                }

                if (choice == 1) {
                  deleteChat(context);
                }
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            AdTileMessage(ad: chatController.ad!),
            Expanded(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: Observer(
                  builder: (_) {
                    return ListView.builder(
                      shrinkWrap: true,
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      controller: scrollController,
                      reverse: true,
                      itemCount: messageController.messagesList.length,
                      itemBuilder: (context, index) {
                        return MessageTile(message: messageController.messagesList[index]);
                      },
                    );
                  },
                ),
              )
            ),
          if (chatController.ad?.adStatus == AdStatus.active)
            Observer(
              builder: (_) {
                if (messageController.error != null) {
                  return Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(4))
                      ),
                      child: Column(
                        children: <Widget> [
                          const SizedBox(height: 16),
                          Center(
                            child: Text(
                              messageController.error,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  );
                }

                return MessageTextField(controller: messageController);
              },
            ),
          if (chatController.ad!.adStatus!.index >= AdStatus.sold.index)
            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const <Widget> [
                  SizedBox(height: 8),
                  Center(
                    child: Icon(Icons.dangerous),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Não é possível continuar esta conversa porque o anúncio não está mais ativo.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteChat(BuildContext context) {
    if (chatController.chatHome == null) {
      return;
    }

    showDialog(
      context: context, 
      builder: (context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: const Text('Excluir'),
            content: Text(
              'Confirma a exclusão do Chat\n ${chatController.ad!.title}',
            ),
            actions: <Widget> [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: Navigator.of(context).pop,
                child: const Text('Não'),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () async {
                  chatController.deleteChat(chatController.chatHome!);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('Sim'),
              ),
            ],
          );
        }

        return AlertDialog(
          title: const Text('Excluir'),
          content: Text( 'Confirma a exclusão do Chat\n ${chatController.ad!.title}'),
          actions: <Widget> [
            TextButton(
              onPressed: Navigator.of(context).pop, 
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                chatController.deleteChat(chatController.chatHome!);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }, 
              child: const Text('Sim'),
            ),
          ],
        );
      }
    );
  }

  void showProfile(BuildContext context) {
    final user = chatController.destination;

    showModalBottomSheet(
      context: context, 
      builder: (context) {
        return Container(
          margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            children: <Widget> [
              Center(
                child: Text(
                  user!.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Na XLO desde ${user.createdAt!.formatedDate()}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const Divider(),
              Center(
                child: Text(
                  user.type.index == 0 ? 'Particular' : 'Professional',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget> [
                    const Icon(Icons.phone),
                    Center(
                      child: Text(user.phone),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}