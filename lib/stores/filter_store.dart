import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/city.dart';
import '../models/uf.dart';

part 'filter_store.g.dart';

enum OrderBy { date, price }
const sellerTypeParticular = 1 << 0;
const sellerTypeProfessional = 1 << 1;

// ignore: library_private_types_in_public_api
class FilterStore = _FilterStoreBase with _$FilterStore;

abstract class _FilterStoreBase with Store {

  _FilterStoreBase({
    required this.orderBy,
    required this.maxPrice,
    required this.minPrice,
    required this.sellerType,
    required this.city,
    required this.uf,
  });

  @observable
  OrderBy orderBy = OrderBy.date;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;

  @observable
  int? minPrice;

  @observable
  int? maxPrice;

  @action
  void setMinPrice(int? value) => minPrice = value;

  @action
  void setMaxPrice(int? value) => maxPrice = value;

  @computed
  String? get priceError => maxPrice != null && minPrice != null && maxPrice! < minPrice! ? 'Faixa de preço inválida' : null;

  @observable
  int sellerType = 0;

  @action
  void selectSellerType(int value) => sellerType = value;
  void setSellerType(int type) => sellerType = sellerType | type;
  void resetSellerType(int type) => sellerType = sellerType & ~type;

  @computed
  bool get isTypeParticular => (sellerType & sellerTypeParticular) != 0;
  bool get isTypeProfessional => (sellerType & sellerTypeProfessional) != 0;

  @computed
  bool get isFormValid => priceError == null;

  Color get buttonColor => isFormValid ? Colors.orange : Colors.orange.withAlpha(120);

  FilterStore clone() {
    return FilterStore(
      orderBy: orderBy,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sellerType: sellerType,
      city: city,
      uf: uf,
    );
  }

  @observable
  City? city;

  @action
  void setCity(City? value) => city = value;

  @observable
  UF? uf;

  @action
  void setUF(UF? value) => uf = value;

  copyWith({
    int? minPrice,
    int? maxPrice,
    OrderBy? orderBy,
    int? sellerType,
    UF? uf,
    City? city,
  }) {
    return FilterStore(
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      orderBy: orderBy ?? this.orderBy,
      sellerType: sellerType ?? this.sellerType,
      uf: uf ?? this.uf,
      city: city ?? this.city,
    );
  }

}