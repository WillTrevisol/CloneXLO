class UF {
  
  int? id;
  String initials;
  String name;

  UF({this.id, required this.initials, required this.name});

  factory UF.fromJson(Map<String, dynamic> data) => UF(
    id: data['id'],
    initials: data['sigla'],
    name: data['nome'],
  );

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'sigla' : initials,
      'nome' : name,
    };
  }

  @override
  String toString() {
    return 'Id: $id, Initials: $initials, Name: $name';
  }

}