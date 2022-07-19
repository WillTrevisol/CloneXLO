import 'package:clone_xlo_flutter/repositories/category_repository.dart';
import 'package:mobx/mobx.dart';

import '../models/category.dart';
part 'category_store.g.dart';

// ignore: library_private_types_in_public_api
class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  
  _CategoryStoreBase() {
    _loadCategories();
  }

  @observable
  ObservableList<Category> categoriesList = ObservableList<Category>();

  @action
  void setCategories(List<Category> categories) {
    categoriesList.clear();

    categoriesList.addAll(categories);
  }

  @observable
  dynamic errorMessage;

  @action
  void setError(dynamic value) => errorMessage = value;

  @computed
  List<Category> get allCategoryList => List.from(categoriesList)
    ..insert(0, Category(id: '1', description: 'Todos'));

  Future<void> _loadCategories() async {
    setError(null);

    try {
      final categories = await CategoryRepository().getList();

      setCategories(categories);
    } catch (e) {
      setError(e);
    }
  }

}