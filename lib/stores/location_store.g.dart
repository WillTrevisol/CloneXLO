// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationStore on _LocationStoreBase, Store {
  Computed<bool>? _$showLocationScreenComputed;

  @override
  bool get showLocationScreen => (_$showLocationScreenComputed ??=
          Computed<bool>(() => super.showLocationScreen,
              name: '_LocationStoreBase.showLocationScreen'))
      .value;
  Computed<bool>? _$exitLocationScreenComputed;

  @override
  bool get exitLocationScreen => (_$exitLocationScreenComputed ??=
          Computed<bool>(() => super.exitLocationScreen,
              name: '_LocationStoreBase.exitLocationScreen'))
      .value;
  Computed<bool>? _$readyToFetchAdsComputed;

  @override
  bool get readyToFetchAds =>
      (_$readyToFetchAdsComputed ??= Computed<bool>(() => super.readyToFetchAds,
              name: '_LocationStoreBase.readyToFetchAds'))
          .value;

  late final _$addressAtom =
      Atom(name: '_LocationStoreBase.address', context: context);

  @override
  Address? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_LocationStoreBase.status', context: context);

  @override
  LocationStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(LocationStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$_LocationStoreBaseActionController =
      ActionController(name: '_LocationStoreBase', context: context);

  @override
  void setAddress(Address value) {
    final _$actionInfo = _$_LocationStoreBaseActionController.startAction(
        name: '_LocationStoreBase.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$_LocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(LocationStatus value) {
    final _$actionInfo = _$_LocationStoreBaseActionController.startAction(
        name: '_LocationStoreBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$_LocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
address: ${address},
status: ${status},
showLocationScreen: ${showLocationScreen},
exitLocationScreen: ${exitLocationScreen},
readyToFetchAds: ${readyToFetchAds}
    ''';
  }
}
