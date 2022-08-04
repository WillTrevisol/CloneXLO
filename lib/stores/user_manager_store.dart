import 'package:clone_xlo_flutter/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../models/user.dart';
part 'user_manager_store.g.dart';

// ignore: library_private_types_in_public_api
class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {

  _UserManagerStore() {
    _getCurrentUser();
  }
  
  @observable
  User? user;

  @action
  void setUser(User? value) {
    user = value;
    updateUserOneSignal(value);
  }

  @observable
  bool readyToFetchAds = false;

  @action
  void setReadyToFetchAds(bool value) => readyToFetchAds = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentUser() async {
    setReadyToFetchAds(false);
    final user = await UserRepository().currentUser();

    setUser(user);
    setReadyToFetchAds(true);
  }

  Future<void> logout() async {
    await UserRepository().logout();
    setUser(null);
  }

  void updateUserOneSignal(User? user) {
    if (user != null) {
      OneSignal.shared.setExternalUserId(user.id!);
    }

    OneSignal.shared.removeExternalUserId();
  }

}