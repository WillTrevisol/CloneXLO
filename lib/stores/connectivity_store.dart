import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobx/mobx.dart';
part 'connectivity_store.g.dart';

// ignore: library_private_types_in_public_api
class ConnectivityStore = _ConnectivityStoreBase with _$ConnectivityStore;

abstract class _ConnectivityStoreBase with Store {
  
  _ConnectivityStoreBase() {
    _setupListener();
  }

  void _setupListener() {
    final InternetConnectionChecker customCheck = InternetConnectionChecker.createInstance(
      checkInterval: const Duration(seconds: 5),
      checkTimeout: const Duration(seconds: 5),
    );

    customCheck.onStatusChange.listen(
      (event) { 
        setConnected(event == InternetConnectionStatus.connected);
      }
    );
  }

  @observable
  bool connected = true;

  @action
  void setConnected(bool value) => connected = value;

}