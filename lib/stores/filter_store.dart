import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

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
    );
  }

}