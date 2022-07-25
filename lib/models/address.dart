import 'city.dart';
import 'uf.dart';

class Address {

  UF? uf;
  City? city;
  String? zipCode;
  String? district;

  Address({required this.uf, required this.city, this.zipCode, this.district});

  @override
  String toString() {
    return 'Uf: {$uf}, City: {$city}, ZipCode: $zipCode, District: $district ';
  }
}