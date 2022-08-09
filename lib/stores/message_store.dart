import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../helpers/log.dart';
import '../models/messages.dart';
import '../repositories/message_repository.dart';
import 'chat_home_store.dart';
part 'message_store.g.dart';

// ignore: library_private_types_in_public_api
class MessageStore = _MessageStoreBase with _$MessageStore;

abstract class _MessageStoreBase with Store {

  _MessageStoreBase() {
    when(
      (_) => chatController.chatHome != null, 
      () {
        if (!chatController.isNew) {
          getMessagesList();
        }
        liveMessageList();
      }
    );
  }

  final ChatHomeStore chatController = GetIt.I.get<ChatHomeStore>();
  final MessageRepository messageRepository = MessageRepository();
  
  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;

  @observable
  ObservableList<Message> messagesList = ObservableList<Message>();

  @action
  getMessagesList() async {
    try {
      setLoading(true);
      List<Message>? messages;
      messages = await messageRepository.getMessagesList(chatController.chatHome!);
      messagesList.clear();
      if (messages != null) {
        messagesList.addAll(messages);
      }
    } catch (e) {
      log.i(e);
    }
    setLoading(false);
  }

  void liveMessageList() async {
    messageRepository.liveMessageList(
      chat: chatController.chatHome!, 
      onNewMessage: (Message message) {
        messagesList.insert(0, message);
      }
    );
  }

  @action
  sendMessage(String message) async {
    if (chatController.chatHome == null) {
      final chat = await chatController.createChat(ad: chatController.ad!);
      if (chat != null) {
        chatController.setChatHome(chat);
      }
    }

    if (!chatController.chatHomeList.any(
      (element) => element.id == chatController.chatHome?.id)) {
        setError('Chat foi excluído');
        return;
    }

    messageRepository.saveMessage(
      chat: chatController.chatHome!, 
      textMessage: message, 
      users: chatController.users, 
      destination: chatController.destination!,
    );
  }

  void cancelLive() {
    chatController.setChatHome(null);
    chatController.setAd(null);
    messageRepository.cancelLiveQuery();
  }

}