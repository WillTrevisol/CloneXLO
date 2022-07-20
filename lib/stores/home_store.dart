import 'package:mobx/mobx.dart';

import '../models/ad.dart';
import '../models/category.dart';
import '../repositories/ad_repository.dart';
import 'filter_store.dart';
part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {

  _HomeStoreBase() {
    autorun((_) async {
      try {
        setLoading(true);
        final newAds = await AdRepository().getHomeAdList(
          filter: filter,
          search: search,
          category: category,
          page: page,
        );

        addNewAds(newAds);
        setError(null);
      } catch (e) {
        setError(e);
      }
      setLoading(false);
    });
  }

  ObservableList<Ad> adList = ObservableList<Ad>();
  
  @observable
  String search = '';

  @action
  void setSearch(String value) {
    search = value;
    resetPage();
  }

  @observable
  Category? category;

  @action
  void setCategory(Category value) {
    category = value;
    resetPage();
  }

  @observable
  FilterStore filter = FilterStore(
    orderBy: OrderBy.date,
    minPrice: null,
    maxPrice: null,
    sellerType: sellerTypeParticular,
  );

  FilterStore get clonedFilter => filter.clone();

  @action
  void setFilter(FilterStore value) {
    filter = value;
    resetPage();
  }

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  int page = 0;

  @action
  void loadNextPage() => page++;

  @observable
  bool lastPage = false;

  @action
  void addNewAds(List<Ad> newAds) {

    if (newAds.length < 10) {
      lastPage = true;
    }
    adList.addAll(newAds);
  }

  @computed
  int get itemCount => lastPage ? adList.length : adList.length + 1;

  @computed
  bool get showProgress => loading && adList.isEmpty;

  void resetPage() {
    page = 0;
    adList.clear();
    lastPage = false;
  }

}