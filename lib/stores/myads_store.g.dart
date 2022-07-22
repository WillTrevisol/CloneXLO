// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myads_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyAdsStore on _MyAdsStoreBase, Store {
  Computed<List<Ad>>? _$activeAdsComputed;

  @override
  List<Ad> get activeAds =>
      (_$activeAdsComputed ??= Computed<List<Ad>>(() => super.activeAds,
              name: '_MyAdsStoreBase.activeAds'))
          .value;
  Computed<List<Ad>>? _$pendingAdsComputed;

  @override
  List<Ad> get pendingAds =>
      (_$pendingAdsComputed ??= Computed<List<Ad>>(() => super.pendingAds,
              name: '_MyAdsStoreBase.pendingAds'))
          .value;
  Computed<List<Ad>>? _$soldAdsComputed;

  @override
  List<Ad> get soldAds =>
      (_$soldAdsComputed ??= Computed<List<Ad>>(() => super.soldAds,
              name: '_MyAdsStoreBase.soldAds'))
          .value;

  late final _$adListAtom =
      Atom(name: '_MyAdsStoreBase.adList', context: context);

  @override
  List<Ad> get adList {
    _$adListAtom.reportRead();
    return super.adList;
  }

  @override
  set adList(List<Ad> value) {
    _$adListAtom.reportWrite(value, super.adList, () {
      super.adList = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_MyAdsStoreBase.loading', context: context);

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
      Atom(name: '_MyAdsStoreBase.error', context: context);

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

  late final _$_MyAdsStoreBaseActionController =
      ActionController(name: '_MyAdsStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_MyAdsStoreBaseActionController.startAction(
        name: '_MyAdsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_MyAdsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_MyAdsStoreBaseActionController.startAction(
        name: '_MyAdsStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_MyAdsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
adList: ${adList},
loading: ${loading},
error: ${error},
activeAds: ${activeAds},
pendingAds: ${pendingAds},
soldAds: ${soldAds}
    ''';
  }
}
