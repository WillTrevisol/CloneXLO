import 'package:mobx/mobx.dart';

import '../models/address.dart';
import '../repositories/zipcode_repository.dart';
part 'zipcode_store.g.dart';

// ignore: library_private_types_in_public_api
class ZipCodeStore = _ZipCodeStoreBase with _$ZipCodeStore;

abstract class _ZipCodeStoreBase with Store {

  _ZipCodeStoreBase(String? initialZipCode) {
    autorun((_) {
      if (clearZipCode.length != 8) {
        _reset();
      } else {
        _searchZipCode();
      }
    });

    setZipCode(initialZipCode);
  }
  
  @observable
  String? zipCode = '';

  @action
  void setZipCode(String? value) => zipCode = value;

  @computed
  String get clearZipCode => zipCode!.replaceAll(RegExp('[^0-9]'), '');

  @observable
  Address? address;

  @action
  void setAddress(Address? value) => address = value;

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  Future<void> _searchZipCode() async {
    setLoading(true);

    try {
      
      final responseAddress = await ZipCodeRepository().getAdress(clearZipCode);
      setAddress(responseAddress);

    } catch (e) {
      setError(e);
      setAddress(null);
    }

    setLoading(false);
  }
  
  @action
  void _reset() {
    error = null;
    address = null;
  }

}