import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../repositories/table_keys.dart';
import '../repositories/user_repository.dart';
import 'address.dart';
import 'category.dart';
import 'city.dart';
import 'uf.dart';
import 'user.dart';

enum AdStatus { pending, active, sold, deleted }

class Ad {

  String? id;
  List images;
  String title;
  String description;
  Category? category;
  Address? address;
  num? price;
  bool? hidePhone;
  AdStatus? adStatus = AdStatus.pending;
  DateTime? createdAt;
  User? user;
  int? views;

  Ad({
    this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.category,
    required this.address,
    required this.price,
    required this.hidePhone,
    this.adStatus = AdStatus.pending,
    this.createdAt,
    required this.user,
    this.views,
  });

  factory Ad.fromParse(ParseObject object) {
    return Ad(
      id: object.objectId,
      images: object.get<List>(keyAdImages)!.map((file) => file.url).toList(), 
      title: object.get<String>(keyAdTitle)!, 
      description: object.get<String>(keyAdDescription)!, 
      category: Category.fromParse(object.get<ParseObject>(keyAdCategory)!),
      address: Address(
        district: object.get<String>(keyAdDistrict),
        city: City(
          name: object.get<String>(keyAdCity)!
          ),
        zipCode: object.get<String>(keyAdZipCode),
        uf: UF(
          initials: object.get<String>(keyAdUf)!,
          name: 'Default',
        ),
      ), 
      price: object.get<num>(keyAdPrice), 
      hidePhone: object.get<bool>(keyAdHidePhone), 
      user: UserRepository().parseToUser(object.get<ParseUser>(keyAdOwner)!),
      adStatus: AdStatus.values[object.get<int>(keyAdStatus)!],
      createdAt: object.createdAt,
      views: object.get<int>(keyAdViews),
    );
  }

}