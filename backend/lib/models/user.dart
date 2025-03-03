import 'package:backend/db/converters/string_list_type_converter.dart';
import 'package:drift/drift.dart';

enum Role { admin, moderator, user }

extension RoleStringExtension on String {
  Role toRole() =>
      Role.values.firstWhere((element) => element.toString() == this);
}

class UserModel {
  final String id;
  final String username;
  final String email;
  final String password;
  final Role role;
  List<String> postIds = [];
  List<String> commentIds = [];
  List<String> tournamentIds = [];

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
    required this.postIds,
    required this.commentIds,
    required this.tournamentIds,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      role: json['role'].toString().toRole(),
      postIds: List<String>.from(json['posts']),
      commentIds: List<String>.from(json['comments']),
      tournamentIds: List<String>.from(json['tournaments']),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'username': username,
    'email': email,
    'password': password,
    'role': role.toString(),
    'postIds': postIds,
    'commentIds': commentIds,
    'tournamentIds': tournamentIds,
  };
}

class Users extends Table {
  @override
  String get tableName => 'users';

  @override
  bool get isStrict => true;

  TextColumn get id => text().named('_id')();
  TextColumn get username =>
      text().withLength(min: 1, max: 20).named('username')();
  TextColumn get email => text().named('email')();
  TextColumn get password => text().named('password')();
  TextColumn get role => text().named('role').withDefault(Constant('user'))();
  TextColumn get posts => text().map(StringListTypeConverter())();
  TextColumn get comments => text().map(StringListTypeConverter())();
  TextColumn get tournaments => text().map(StringListTypeConverter())();
}
