// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteStore on _FavoriteStoreBase, Store {
  late final _$errorAtom =
      Atom(name: '_FavoriteStoreBase.error', context: context);

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

  late final _$_getFavoriteListAsyncAction =
      AsyncAction('_FavoriteStoreBase._getFavoriteList', context: context);

  @override
  Future<void> _getFavoriteList() {
    return _$_getFavoriteListAsyncAction.run(() => super._getFavoriteList());
  }

  late final _$toggleFavoriteAsyncAction =
      AsyncAction('_FavoriteStoreBase.toggleFavorite', context: context);

  @override
  Future<void> toggleFavorite(Ad ad) {
    return _$toggleFavoriteAsyncAction.run(() => super.toggleFavorite(ad));
  }

  late final _$_FavoriteStoreBaseActionController =
      ActionController(name: '_FavoriteStoreBase', context: context);

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_FavoriteStoreBaseActionController.startAction(
        name: '_FavoriteStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error}
    ''';
  }
}
