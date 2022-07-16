import 'package:mobx/mobx.dart';
part 'create_ad_store.g.dart';

// ignore: library_private_types_in_public_api
class CreateAdStore = _CreateAdStoreBase with _$CreateAdStore;

abstract class _CreateAdStoreBase with Store {
  

  @observable
  ObservableList images = ObservableList();

}