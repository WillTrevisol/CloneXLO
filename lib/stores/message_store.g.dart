// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MessageStore on _MessageStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_MessageStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_MessageStoreBase.error', context: context);

  @override
  dynamic get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(dynamic value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$messagesListAtom =
      Atom(name: '_MessageStoreBase.messagesList', context: context);

  @override
  ObservableList<Message> get messagesList {
    _$messagesListAtom.reportRead();
    return super.messagesList;
  }

  @override
  set messagesList(ObservableList<Message> value) {
    _$messagesListAtom.reportWrite(value, super.messagesList, () {
      super.messagesList = value;
    });
  }

  late final _$getMessagesListAsyncAction =
      AsyncAction('_MessageStoreBase.getMessagesList', context: context);

  @override
  Future getMessagesList() {
    return _$getMessagesListAsyncAction.run(() => super.getMessagesList());
  }

  late final _$sendMessageAsyncAction =
      AsyncAction('_MessageStoreBase.sendMessage', context: context);

  @override
  Future sendMessage(String message) {
    return _$sendMessageAsyncAction.run(() => super.sendMessage(message));
  }

  late final _$_MessageStoreBaseActionController =
      ActionController(name: '_MessageStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_MessageStoreBaseActionController.startAction(
        name: '_MessageStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_MessageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_MessageStoreBaseActionController.startAction(
        name: '_MessageStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_MessageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
messagesList: ${messagesList}
    ''';
  }
}
