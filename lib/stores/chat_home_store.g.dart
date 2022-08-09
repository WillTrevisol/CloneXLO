// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatHomeStore on _ChatHomeStoreBase, Store {
  Computed<ChatHome?>? _$chatHomeComputed;

  @override
  ChatHome? get chatHome =>
      (_$chatHomeComputed ??= Computed<ChatHome?>(() => super.chatHome,
              name: '_ChatHomeStoreBase.chatHome'))
          .value;
  Computed<Ad?>? _$adComputed;

  @override
  Ad? get ad => (_$adComputed ??=
          Computed<Ad?>(() => super.ad, name: '_ChatHomeStoreBase.ad'))
      .value;
  Computed<List<User>>? _$usersComputed;

  @override
  List<User> get users =>
      (_$usersComputed ??= Computed<List<User>>(() => super.users,
              name: '_ChatHomeStoreBase.users'))
          .value;
  Computed<User>? _$senderComputed;

  @override
  User get sender => (_$senderComputed ??=
          Computed<User>(() => super.sender, name: '_ChatHomeStoreBase.sender'))
      .value;
  Computed<User?>? _$destinationComputed;

  @override
  User? get destination =>
      (_$destinationComputed ??= Computed<User?>(() => super.destination,
              name: '_ChatHomeStoreBase.destination'))
          .value;

  late final _$_chatHomeAtom =
      Atom(name: '_ChatHomeStoreBase._chatHome', context: context);

  @override
  ChatHome? get _chatHome {
    _$_chatHomeAtom.reportRead();
    return super._chatHome;
  }

  @override
  set _chatHome(ChatHome? value) {
    _$_chatHomeAtom.reportWrite(value, super._chatHome, () {
      super._chatHome = value;
    });
  }

  late final _$_adAtom = Atom(name: '_ChatHomeStoreBase._ad', context: context);

  @override
  Ad? get _ad {
    _$_adAtom.reportRead();
    return super._ad;
  }

  @override
  set _ad(Ad? value) {
    _$_adAtom.reportWrite(value, super._ad, () {
      super._ad = value;
    });
  }

  late final _$chatHomeListAtom =
      Atom(name: '_ChatHomeStoreBase.chatHomeList', context: context);

  @override
  ObservableList<ChatHome> get chatHomeList {
    _$chatHomeListAtom.reportRead();
    return super.chatHomeList;
  }

  @override
  set chatHomeList(ObservableList<ChatHome> value) {
    _$chatHomeListAtom.reportWrite(value, super.chatHomeList, () {
      super.chatHomeList = value;
    });
  }

  late final _$isNewAtom =
      Atom(name: '_ChatHomeStoreBase.isNew', context: context);

  @override
  bool get isNew {
    _$isNewAtom.reportRead();
    return super.isNew;
  }

  @override
  set isNew(bool value) {
    _$isNewAtom.reportWrite(value, super.isNew, () {
      super.isNew = value;
    });
  }

  late final _$_getChatRoomListAsyncAction =
      AsyncAction('_ChatHomeStoreBase._getChatRoomList', context: context);

  @override
  Future<void> _getChatRoomList() {
    return _$_getChatRoomListAsyncAction.run(() => super._getChatRoomList());
  }

  late final _$createChatAsyncAction =
      AsyncAction('_ChatHomeStoreBase.createChat', context: context);

  @override
  Future<ChatHome?> createChat({required Ad ad}) {
    return _$createChatAsyncAction.run(() => super.createChat(ad: ad));
  }

  late final _$_ChatHomeStoreBaseActionController =
      ActionController(name: '_ChatHomeStoreBase', context: context);

  @override
  void setChatHome(ChatHome? value) {
    final _$actionInfo = _$_ChatHomeStoreBaseActionController.startAction(
        name: '_ChatHomeStoreBase.setChatHome');
    try {
      return super.setChatHome(value);
    } finally {
      _$_ChatHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAd(Ad? value) {
    final _$actionInfo = _$_ChatHomeStoreBaseActionController.startAction(
        name: '_ChatHomeStoreBase.setAd');
    try {
      return super.setAd(value);
    } finally {
      _$_ChatHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsNew(bool value) {
    final _$actionInfo = _$_ChatHomeStoreBaseActionController.startAction(
        name: '_ChatHomeStoreBase.setIsNew');
    try {
      return super.setIsNew(value);
    } finally {
      _$_ChatHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chatHomeList: ${chatHomeList},
isNew: ${isNew},
chatHome: ${chatHome},
ad: ${ad},
users: ${users},
sender: ${sender},
destination: ${destination}
    ''';
  }
}
