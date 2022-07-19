import 'package:mobx/mobx.dart';
part 'filter_store.g.dart';

enum OrderBy { date, price }

// ignore: library_private_types_in_public_api
class FilterStore = _FilterStoreBase with _$FilterStore;

abstract class _FilterStoreBase with Store {

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

}