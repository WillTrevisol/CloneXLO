class City {

  int? id;
  String name;

  City({this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> data) => City(
    id: data['id'],
    name: data['nome'],
  );

  @override
  String toString() {
    return 'Id: $id, Name: $name';
  }

}