class City {

  String? id;
  String name;

  City({this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> data) => City(
    id: data['id'],
    name: data['nome'],
  );

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'nome' : name,
    };
  }

  @override
  String toString() {
    return 'Id: $id, Name: $name';
  }

}