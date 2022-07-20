enum UserType {particular, professional}

class User {

  String? id;
  String name;
  String? email;
  String phone;
  String? password;
  UserType type;
  DateTime? createdAt;

  User({
    this.id,
    required this.name, 
    required this.email, 
    required this.phone, 
    this.password,
    this.type = UserType.particular,
    this.createdAt,
  });

  @override
  String toString() {
    return '''
      Id: $id,
      Name: $name,
      Email: $email,
      Phone: $phone,
      Password: $password,
      Type: $type,
      CreatedAt: $createdAt,
    ''';
  }

}