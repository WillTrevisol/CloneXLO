class UF {
  
  int id;
  String initials;
  String name;

  UF({required this.id, required this.initials, required this.name});

  factory UF.fromJson(Map<String, dynamic> data) => UF(
    id: data['id'],
    initials: data['sigla'],
    name: data['nome'],
  );

  @override
  String toString() {
    return 'Id: $id, Initials: $initials, Name: $name';
  }

}