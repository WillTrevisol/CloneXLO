import 'package:diacritic/diacritic.dart';
import 'package:mobx/mobx.dart';

import '../models/city.dart';
import '../models/uf.dart';
import '../repositories/ibge_repository.dart';
part 'uf_city_store.g.dart';

// ignore: library_private_types_in_public_api
class UfCityStore = _UfCityStoreBase with _$UfCityStore;

abstract class _UfCityStoreBase with Store {

  _UfCityStoreBase({required UF? uf, required this.showAll}) {
    setItem(uf);
  }
  
  bool showAll;

  ObservableList list = ObservableList();


  @action
  void setList(List items) {
    list.addAll(items);
  }

  @observable
  String search = '';

  @action
  void setSearch(String value) => search = removeDiacritics(value.toLowerCase());

  @observable
  UF? uf;

  @observable
  City? city;

  @action
  void setItem(dynamic value) {
    if (value == null) {
      uf = null;
      list.clear();
      IbgeRepository().getUFList().then( (value) => setList(value as List<UF>) ).catchError(setError);
    // ignore: prefer_conditional_assignment
    } else if (uf == null) {
      uf = value;
      list.clear();
      IbgeRepository().getCityListFromApi(uf!).then((value) => setList(value as List<City>)).catchError(setError);
    } else {
      city = value;
    }

    setSearch('');
  }

  @computed
  List get listFiltered {
    if (search.isEmpty) {
      if (!showAll) {
        return list;
      } else if (uf == null) {
        return List.from(list)..insert(0, UF(initials: 'td', name: 'Todos', id: -1));
      } else {
        return List.from(list)..insert(0, City(name: 'Todas', id: '*'));
      }
    } else {
      return list.where((element) => removeDiacritics(element.name.toLowerCase()).contains(search)).toList();
    }

  }

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;

}