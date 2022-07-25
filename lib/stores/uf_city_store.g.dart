// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uf_city_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UfCityStore on _UfCityStoreBase, Store {
  Computed<List<dynamic>>? _$listFilteredComputed;

  @override
  List<dynamic> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<dynamic>>(() => super.listFiltered,
              name: '_UfCityStoreBase.listFiltered'))
      .value;

  late final _$searchAtom =
      Atom(name: '_UfCityStoreBase.search', context: context);

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$ufAtom = Atom(name: '_UfCityStoreBase.uf', context: context);

  @override
  UF? get uf {
    _$ufAtom.reportRead();
    return super.uf;
  }

  @override
  set uf(UF? value) {
    _$ufAtom.reportWrite(value, super.uf, () {
      super.uf = value;
    });
  }

  late final _$cityAtom = Atom(name: '_UfCityStoreBase.city', context: context);

  @override
  City? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(City? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_UfCityStoreBase.error', context: context);

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

  late final _$_UfCityStoreBaseActionController =
      ActionController(name: '_UfCityStoreBase', context: context);

  @override
  void setList(List<dynamic> items) {
    final _$actionInfo = _$_UfCityStoreBaseActionController.startAction(
        name: '_UfCityStoreBase.setList');
    try {
      return super.setList(items);
    } finally {
      _$_UfCityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_UfCityStoreBaseActionController.startAction(
        name: '_UfCityStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_UfCityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItem(dynamic value) {
    final _$actionInfo = _$_UfCityStoreBaseActionController.startAction(
        name: '_UfCityStoreBase.setItem');
    try {
      return super.setItem(value);
    } finally {
      _$_UfCityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_UfCityStoreBaseActionController.startAction(
        name: '_UfCityStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_UfCityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
uf: ${uf},
city: ${city},
error: ${error},
listFiltered: ${listFiltered}
    ''';
  }
}
