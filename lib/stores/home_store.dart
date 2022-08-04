import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../helpers/log.dart';
import '../models/ad.dart';
import '../models/address.dart';
import '../models/category.dart';
import '../repositories/ad_repository.dart';
import 'connectivity_store.dart';
import 'filter_store.dart';
import 'location_store.dart';
import 'user_manager_store.dart';
part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {

  final ConnectivityStore connectivity = GetIt.I.get<ConnectivityStore>();
  final LocationStore locationController = GetIt.I.get<LocationStore>();
  final UserManagerStore userController = GetIt.I.get<UserManagerStore>();

  _HomeStoreBase() {
    autorun((_) async {
      connectivity.connected;

      reaction(
        (_) => locationController.address,
        (Address? address) {
          if (address != null) {
            setFilter(filter.copyWith(city: address.city, uf: address.uf));
          }
        }
      );

      try {
        setLoading(true);

        if (!locationController.readyToFetchAds) return;

        if (!userController.readyToFetchAds) return;

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
    city: null,
    uf: null,
  );

  FilterStore get clonedFilter => filter.clone();

  @action
  void setFilter(dynamic value) {
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

  Future<Ad?> getAdById(String id) async {
    return await AdRepository().getAdById(id);
  }

  Future<void> incrementViews(Ad ad) async {
    try {
      await AdRepository().incrementViews(ad);
    } catch (e) {
      log.i(e);
    }
  }

}