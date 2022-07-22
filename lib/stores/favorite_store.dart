import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/ad.dart';
import '../repositories/favorite_repository.dart';
import 'user_manager_store.dart';
part 'favorite_store.g.dart';

// ignore: library_private_types_in_public_api
class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {

  _FavoriteStoreBase() {
    reaction(
      (_) => userController.isLoggedIn, 
      (_) => _getFavoriteList(),
    );
  }

  final UserManagerStore userController = GetIt.I.get<UserManagerStore>();

  ObservableList<Ad> favoriteList = ObservableList<Ad>();

  @action
  Future<void> _getFavoriteList() async {
    setError(null);

    try {
      favoriteList.clear();
      final favorites = await FavoriteRepository().getFavorites(userController.user!);
      favoriteList.addAll(favorites);
    } catch (e) {
      setError(e);
    }
  }

  @action
  Future<void> toggleFavorite(Ad ad) async {
    setError(null);

    try {
      if (favoriteList.any((element) => element.id == ad.id)) {
        favoriteList.removeWhere((element) => element.id == ad.id);
        await FavoriteRepository().delete(ad, userController.user!);
      } else {
        favoriteList.add(ad);
        await FavoriteRepository().save(ad, userController.user!);
      }
    } catch (e) {
      setError(e);
    }
    
  }

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;

}