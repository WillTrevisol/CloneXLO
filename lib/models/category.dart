import 'package:clone_xlo_flutter/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Category {

  String? id;
  String? description;

  Category({required this.id, required this.description});

  Category.fromParse(ParseObject parseObject) :
    id = parseObject.objectId,
    description = parseObject.get(keyCategoryDescription);

  @override
  String toString() {
    return '''
      Id: $id,
      Description: $description,
    ''';
  }
}