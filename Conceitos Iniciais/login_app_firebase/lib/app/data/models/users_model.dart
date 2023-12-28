class UsersModel {
  final String name;
  final String username;
  final String email;
  final String password;

  UsersModel(
      {required this.name,
      required this.username,
      required this.email,
      required this.password});

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    final fullName = "${map['firstName']} ${map['lastName']}";

    return UsersModel(
      name: fullName,
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }
}
