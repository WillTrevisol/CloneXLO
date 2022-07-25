import 'dart:convert';

import 'package:clone_xlo_flutter/helpers/extensions.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/address.dart';
import '../models/city.dart';
import '../models/uf.dart';
import '../models/user_location.dart';
import '../repositories/ibge_repository.dart';
import '../repositories/table_keys.dart';
import 'connectivity_store.dart';
part 'location_store.g.dart';

enum LocationStatus { init, initDone, retrieving, done, failed }

// ignore: library_private_types_in_public_api
class LocationStore = _LocationStoreBase with _$LocationStore;

abstract class _LocationStoreBase with Store {

  final ConnectivityStore connectivity = GetIt.I.get<ConnectivityStore>();

  _LocationStoreBase() {
    autorun((_) async {
      if (connectivity.connected && status == LocationStatus.init) {
        Geolocator.checkPermission().then(
          (value) async {
            if (value == LocationPermission.whileInUse || value == LocationPermission.always) {
              getLocation();
            } else {
              SharedPreferences.getInstance().then(
                (value) {
                  if (value.getKeys().contains(keyUserLocation)) {
                    final userLocation = UserLocation.fromJson(
                      jsonDecode(value.getString(keyUserLocation)!)
                    );

                    Address addressLocal = Address(
                      uf: userLocation.uf, 
                      city: userLocation.city,
                    );

                    if (addressLocal.city != null && addressLocal.uf != null) {
                      setAddress(addressLocal);
                      setStatus(LocationStatus.done);
                      return;
                    }
                  }
                  print('setLocation(LocationStatus.initDone)');
                  setStatus(LocationStatus.initDone);
                }
              );
            }
           }
        );
      }
    });
  }
  
  @observable
  Address? address;

  @action
  void setAddress(Address value) {
    address = value;
    _saveAddress(address!);
    status = LocationStatus.done;
  }

  @observable
  LocationStatus status = LocationStatus.init;

  @action
  void setStatus(LocationStatus value) => status = value;

  @computed
  bool get showLocationScreen => status == LocationStatus.initDone;

  @computed
  bool get exitLocationScreen => status == LocationStatus.done && address != null;

  @computed
  bool get readyToFetchAds => status == LocationStatus.done || status == LocationStatus.failed;

  Future<void> getLocation() async {
    if (status == LocationStatus.retrieving) return;
    setStatus(LocationStatus.retrieving);

    try {

      Future.delayed(const Duration(seconds: 15)).then((_) {
          if (status != LocationStatus.done) {
            setStatus(LocationStatus.failed);
          }
        }
      );

      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium
      );
      
      if (status == LocationStatus.failed) return;

      final List<Placemark> places = await placemarkFromCoordinates(
        position.latitude, position.longitude,
        localeIdentifier: 'pt_BR'
      );

      Placemark place = places.first;
    
      if (place.locality != null) {

        List<UF>? ufs = await IbgeRepository().getUFList();

        UF locationUf;
        City locationCity;

        if (place.locality!.isNotEmpty) {
          locationCity = City(name: place.locality!);
        } else {
          locationCity = City(name: place.subAdministrativeArea!);
        }

        if (place.administrativeArea!.length == 2) {
          locationUf = 
            ufs!.firstWhere((element) => element.initials == place.administrativeArea);
        } else {
          locationUf = 
            ufs!.firstWhere((element) => element.name == place.administrativeArea);
        }

        final Address address = Address(
          district: place.administrativeArea,
          uf: locationUf,
          city: locationCity,
          zipCode: place.postalCode!.formatedPostalCode(),
        );
        setAddress(address);
        print('Location DONE');
        setStatus(LocationStatus.done);
      } else {
        print('Location FAILED');
        setStatus(LocationStatus.failed);
      }
    } catch (e) {
      print('Location FAILED');
      print('getLocation failed => ${e.toString()}');
      setStatus(LocationStatus.failed);
    }
  }

  void _saveAddress(Address address) {
    SharedPreferences.getInstance().then(
      (value) => value.setString(
        keyUserLocation, 
        jsonEncode(UserLocation(city: address.city, uf: address.uf))
      )
    );
  }
}