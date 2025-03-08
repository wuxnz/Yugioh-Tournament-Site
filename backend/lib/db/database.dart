import 'package:backend/models/user.dart';
import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';

import 'package:backend/db/converters/string_list_type_converter.dart';

part 'database.g.dart';

// class TodoItems extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get title => text().withLength(min: 6, max: 32)();
//   TextColumn get content => text().named('body')();
//   DateTimeColumn get createdAt => dateTime().nullable()();
// }

// @DriftDatabase(tables: [TodoItems])
@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  static QueryExecutor _openConnection() {
    return NativeDatabase.createInBackground(File('./db.sqlite'));
  }

  /// User CRUD operations
  /// Get user by ID from DB (assuming there is only one such field in Users table). If no match, return `null` .
  Future<UserModel?> findUserById(String id) async {
    final user =
        await (select(users)..where((u) => u.id.equals(id))).getSingleOrNull();
    if (user != null) {
      return UserModel.fromUser(user);
    } else {
      return null;
    }
  }

  Future<UserModel?> findUserByEmail(String email) async {
    final user =
        await (select(users)
          ..where((u) => u.email.equals(email))).getSingleOrNull();
    if (user != null) {
      return UserModel.fromUser(user);
    } else {
      return null;
    }
  }

  /// Adds a new User to the database and returns its id (auto-incremented) if successful or null otherwise  .
  Future<UserModel?> addNewUser({required UserModel user}) async {
    await into(users).insert(
      UsersCompanion.insert(
        id: user.id,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
        username: user.username,
        email: user.email,
        password: user.password,
        image: user.image,
        role: user.role.toString(),
        posts: user.posts,
        comments: user.comments,
        tournaments: user.tournaments,
      ),
    );
    return await findUserById(user.id);
  }
}
