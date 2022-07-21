import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/ad.dart';
import '../repositories/ad_repository.dart';
import 'user_manager_store.dart';
part 'myads_store.g.dart';

// ignore: library_private_types_in_public_api
class MyAdsStore = _MyAdsStoreBase with _$MyAdsStore;

abstract class _MyAdsStoreBase with Store {
  
  _MyAdsStoreBase() {
    _getMyAds();
  } 


  @observable
  List<Ad> adList = [];

  @computed
  List<Ad> get activeAds => adList.where((ad) => ad.adStatus == AdStatus.active).toList();

  @computed
  List<Ad> get pendingAds => adList.where((ad) => ad.adStatus == AdStatus.pending).toList();

  @computed
  List<Ad> get soldAds => adList.where((ad) => ad.adStatus == AdStatus.sold).toList();

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  Future<void> _getMyAds() async {
    final user = GetIt.I.get<UserManagerStore>().user;
    setLoading(true);
    try {
      adList = await AdRepository().getMyAds(user: user!);
    } catch (e) {
      
    }
    setLoading(false);
  }

  void refresh() => _getMyAds();

}