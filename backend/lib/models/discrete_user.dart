import 'package:backend/models/user.dart';

class DiscreteUser {
  final String id;
  String username;
  String email;
  String password;
  Role role;

  DiscreteUser({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
  });

  factory DiscreteUser.fromJson(Map<String, dynamic> json) {
    return DiscreteUser(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      role: json['role'].toString().toRole(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'password': password,
    'role': role.toString(),
  };
}
