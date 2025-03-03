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
  int get schemaVersion => 3;

  static QueryExecutor _openConnection() {
    return NativeDatabase.createInBackground(File('./db.sqlite'));
  }
}
