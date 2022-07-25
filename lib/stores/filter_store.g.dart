// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FilterStore on _FilterStoreBase, Store {
  Computed<String?>? _$priceErrorComputed;

  @override
  String? get priceError =>
      (_$priceErrorComputed ??= Computed<String?>(() => super.priceError,
              name: '_FilterStoreBase.priceError'))
          .value;
  Computed<bool>? _$isTypeParticularComputed;

  @override
  bool get isTypeParticular => (_$isTypeParticularComputed ??= Computed<bool>(
          () => super.isTypeParticular,
          name: '_FilterStoreBase.isTypeParticular'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_FilterStoreBase.isFormValid'))
          .value;

  late final _$orderByAtom =
      Atom(name: '_FilterStoreBase.orderBy', context: context);

  @override
  OrderBy get orderBy {
    _$orderByAtom.reportRead();
    return super.orderBy;
  }

  @override
  set orderBy(OrderBy value) {
    _$orderByAtom.reportWrite(value, super.orderBy, () {
      super.orderBy = value;
    });
  }

  late final _$minPriceAtom =
      Atom(name: '_FilterStoreBase.minPrice', context: context);

  @override
  int? get minPrice {
    _$minPriceAtom.reportRead();
    return super.minPrice;
  }

  @override
  set minPrice(int? value) {
    _$minPriceAtom.reportWrite(value, super.minPrice, () {
      super.minPrice = value;
    });
  }

  late final _$maxPriceAtom =
      Atom(name: '_FilterStoreBase.maxPrice', context: context);

  @override
  int? get maxPrice {
    _$maxPriceAtom.reportRead();
    return super.maxPrice;
  }

  @override
  set maxPrice(int? value) {
    _$maxPriceAtom.reportWrite(value, super.maxPrice, () {
      super.maxPrice = value;
    });
  }

  late final _$sellerTypeAtom =
      Atom(name: '_FilterStoreBase.sellerType', context: context);

  @override
  int get sellerType {
    _$sellerTypeAtom.reportRead();
    return super.sellerType;
  }

  @override
  set sellerType(int value) {
    _$sellerTypeAtom.reportWrite(value, super.sellerType, () {
      super.sellerType = value;
    });
  }

  late final _$cityAtom = Atom(name: '_FilterStoreBase.city', context: context);

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

  late final _$ufAtom = Atom(name: '_FilterStoreBase.uf', context: context);

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

  late final _$_FilterStoreBaseActionController =
      ActionController(name: '_FilterStoreBase', context: context);

  @override
  void setOrderBy(OrderBy value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinPrice(int? value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.setMinPrice');
    try {
      return super.setMinPrice(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxPrice(int? value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.setMaxPrice');
    try {
      return super.setMaxPrice(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectSellerType(int value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.selectSellerType');
    try {
      return super.selectSellerType(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(City? value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUF(UF? value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.setUF');
    try {
      return super.setUF(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderBy: ${orderBy},
minPrice: ${minPrice},
maxPrice: ${maxPrice},
sellerType: ${sellerType},
city: ${city},
uf: ${uf},
priceError: ${priceError},
isTypeParticular: ${isTypeParticular},
isFormValid: ${isFormValid}
    ''';
  }
}
