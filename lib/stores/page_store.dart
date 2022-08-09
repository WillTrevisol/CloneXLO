import 'package:mobx/mobx.dart';
part 'page_store.g.dart';

// ignore: library_private_types_in_public_api
class PageStore = _PageStoreBase with _$PageStore;

abstract class _PageStoreBase with Store {
  
  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;
  
}