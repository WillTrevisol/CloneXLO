import 'city.dart';
import 'uf.dart';

class UserLocation {

  City? city;
  UF? uf;

  UserLocation({this.city, this.uf});

  factory UserLocation.fromJson(Map<String, dynamic> data) {
    return UserLocation(
      city: City.fromJson(data['city']),
      uf: UF.fromJson(data['uf']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic> {
      'city' : city?.toJson(),
      'uf' : uf?.toJson(),
    };
  }

}