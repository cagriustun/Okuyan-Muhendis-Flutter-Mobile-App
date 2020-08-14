class TestUser {
  int id;
  String name;
  String email;
  TestUser({this.id, this.name, this.email});

  factory TestUser.fromJson(Map<String, dynamic> json) {
    return TestUser(
      id: json["id"] as int,
      name: json["name"] as String,
      email: json["email"] as String,
    );
  }
}
