class User {
  String? id;
  String? name;
  String? password;
  String? email;
  String? phone;
  String? image;

  User(this.id, this.name, this.password, this.email, this.phone, this.image);

  static final columns = ["id", "name", "password", "email", "phone", "image"];

  User.fromMap(Map map) {
    id = map["id"];
    name = map["name"];
    password = map["password"];
    email = map["email"];
    phone = map["phone"];
    image = map["image"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "password": password,
      "email": email,
      "phone": phone,
      "image": image
    };
    return map;
  }
}
