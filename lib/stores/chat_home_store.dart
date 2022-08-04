import 'package:clone_xlo_flutter/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../helpers/log.dart';
import '../models/ad.dart';
import '../models/chat_home.dart';
import '../models/user.dart';
import '../repositories/chat_home_repository.dart';
part 'chat_home_store.g.dart';

// ignore: library_private_types_in_public_api
class ChatHomeStore = _ChatHomeStoreBase with _$ChatHomeStore;

abstract class _ChatHomeStoreBase with Store {


  final UserManagerStore userController = GetIt.I.get<UserManagerStore>();
  final ChatHomeRepository chatRepository = ChatHomeRepository();
  
  @observable
  ChatHome? _chatHome;

  @action
  void setChatHome(ChatHome value) => _chatHome = value;

  @observable
  Ad? _ad;

  @action
  void setAd(Ad value) => _ad = value;

  @observable
  ObservableList<ChatHome> chatHomeList = ObservableList<ChatHome>();

  @observable
  bool isNew = false;

  @action
  void setIsNew(bool value) => isNew = value;

  @computed
  ChatHome? get chatHome {
    if (_chatHome != null) {
      setIsNew(false);
      return _chatHome;
    }

    if (_ad != null) {
      if (chatHomeList.any((element) => element.ad?.id == _ad?.id)) {
        setIsNew(false);
        return chatHomeList.firstWhere((element) => element.ad?.id == _ad?.id);
      }
    }

    setIsNew(true);
    return null;
  }

  @computed
  Ad? get ad {
    if (_chatHome != null) {
      return _chatHome?.ad;
    }
    return _ad;
  }

  @computed
  List<User> get users {
    if (_chatHome != null) {
      return _chatHome!.users!;
    }
    return [
      userController.user!,
      _ad!.user!
    ];
  }

  @computed
  User get sender => userController.user!;

  @computed
  User? get destination => users.firstWhere((element) => element.id == sender.id);

  @action
  Future<void> _getChatRoomList() async {
    try {
      final chats = 
        await chatRepository.getChatHomeList(userController.user!);
      chatHomeList.clear();
      chatHomeList.addAll(chats!);
    } catch (e) {
      log.i(e);
    }
  }

  @action
  _liveChatRoomList() async {
    await chatRepository.liveChatHomeList(
      user: userController.user!, 
      onChanged: () => _getChatRoomList()
    );
  }

  void _cancelLive() {
    chatRepository.cancelLiveQuery();
  }

  void deleteChat(ChatHome chat) async {
    await chatRepository.deleteChatHome(chat);
  }

  @action
  Future<ChatHome?> createChat({required Ad ad}) async {
    try {
      setIsNew(true);

      final ChatHome? chat = await chatRepository
        .createChatHome(ad: ad, users: users);
    } catch (e) {
      log.i(e);
      return null;
    }
  }

}