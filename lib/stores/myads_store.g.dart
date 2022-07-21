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

  @override
  String toString() {
    return '''
adList: ${adList},
activeAds: ${activeAds},
pendingAds: ${pendingAds},
soldAds: ${soldAds}
    ''';
  }
}
