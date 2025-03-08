import 'package:backend/db/converters/string_list_type_converter.dart';
import 'package:backend/db/database.dart';
import 'package:drift/drift.dart';

enum Role { developer, owner, admin, moderator, user }

extension RoleStringExtension on String {
  Role toRole() =>
      Role.values.firstWhere((element) => element.toString() == this);
}

class UserModel {
  final String id;
  final DateTime createdAt;
  DateTime updatedAt;
  String username;
  String email;
  String password;
  String image;
  Role role;
  List<String> posts = [];
  List<String> comments = [];
  List<String> tournaments = [];

  UserModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.email,
    required this.password,
    required this.image,
    required this.role,
    required this.posts,
    required this.comments,
    required this.tournaments,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt'].toString()),
      updatedAt: DateTime.parse(json['updatedAt'].toString()),
      username: json['username'],
      email: json['email'],
      password: json['password'],
      image: json['image'],
      role: json['role'].toString().toRole(),
      posts: List<String>.from(json['posts']),
      comments: List<String>.from(json['comments']),
      tournaments: List<String>.from(json['tournaments']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'username': username,
    'email': email,
    'password': password,
    'image': image,
    'role': role.toString(),
    'posts': posts,
    'comments': comments,
    'tournaments': tournaments,
  };

  factory UserModel.fromUser(User user) => UserModel(
    id: user.id,
    createdAt: user.createdAt,
    updatedAt: user.updatedAt,
    username: user.username,
    email: user.email,
    password: user.password,
    image: user.image,
    role: user.role.toRole(),
    posts: user.posts,
    comments: user.comments,
    tournaments: user.tournaments,
  );
}

class Users extends Table {
  @override
  String get tableName => 'users';

  @override
  bool get isStrict => true;

  TextColumn get id => text().named('id')();
  DateTimeColumn get createdAt => dateTime().named('createdAt')();
  DateTimeColumn get updatedAt => dateTime().named('updatedAt')();
  TextColumn get username =>
      text().withLength(min: 1, max: 20).named('username')();
  TextColumn get email => text().named('email')();
  TextColumn get password => text().named('password')();
  TextColumn get image => text().named('image')();
  TextColumn get role => text().named('role')();
  TextColumn get posts => text().map(StringListTypeConverter())();
  TextColumn get comments => text().map(StringListTypeConverter())();
  TextColumn get tournaments => text().map(StringListTypeConverter())();
}
