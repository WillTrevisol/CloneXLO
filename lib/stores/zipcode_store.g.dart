// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zipcode_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ZipCodeStore on _ZipCodeStoreBase, Store {
  Computed<String>? _$clearZipCodeComputed;

  @override
  String get clearZipCode =>
      (_$clearZipCodeComputed ??= Computed<String>(() => super.clearZipCode,
              name: '_ZipCodeStoreBase.clearZipCode'))
          .value;

  late final _$zipCodeAtom =
      Atom(name: '_ZipCodeStoreBase.zipCode', context: context);

  @override
  String get zipCode {
    _$zipCodeAtom.reportRead();
    return super.zipCode;
  }

  @override
  set zipCode(String value) {
    _$zipCodeAtom.reportWrite(value, super.zipCode, () {
      super.zipCode = value;
    });
  }

  late final _$addressAtom =
      Atom(name: '_ZipCodeStoreBase.address', context: context);

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

  late final _$errorAtom =
      Atom(name: '_ZipCodeStoreBase.error', context: context);

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

  late final _$loadingAtom =
      Atom(name: '_ZipCodeStoreBase.loading', context: context);

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

  late final _$_ZipCodeStoreBaseActionController =
      ActionController(name: '_ZipCodeStoreBase', context: context);

  @override
  void setZipCode(String value) {
    final _$actionInfo = _$_ZipCodeStoreBaseActionController.startAction(
        name: '_ZipCodeStoreBase.setZipCode');
    try {
      return super.setZipCode(value);
    } finally {
      _$_ZipCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(Address? value) {
    final _$actionInfo = _$_ZipCodeStoreBaseActionController.startAction(
        name: '_ZipCodeStoreBase.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$_ZipCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_ZipCodeStoreBaseActionController.startAction(
        name: '_ZipCodeStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_ZipCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ZipCodeStoreBaseActionController.startAction(
        name: '_ZipCodeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ZipCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _reset() {
    final _$actionInfo = _$_ZipCodeStoreBaseActionController.startAction(
        name: '_ZipCodeStoreBase._reset');
    try {
      return super._reset();
    } finally {
      _$_ZipCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
zipCode: ${zipCode},
address: ${address},
error: ${error},
loading: ${loading},
clearZipCode: ${clearZipCode}
    ''';
  }
}
