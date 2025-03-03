// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class Users extends Table with TableInfo<Users, UsersData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Users(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    '_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('\'user\''),
  );
  late final GeneratedColumn<String> posts = GeneratedColumn<String>(
    'posts',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> comments = GeneratedColumn<String>(
    'comments',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> tournaments = GeneratedColumn<String>(
    'tournaments',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    username,
    email,
    password,
    role,
    posts,
    comments,
    tournaments,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UsersData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}_id'],
          )!,
      username:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}username'],
          )!,
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      password:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}password'],
          )!,
      role:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}role'],
          )!,
      posts:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}posts'],
          )!,
      comments:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}comments'],
          )!,
      tournaments:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}tournaments'],
          )!,
    );
  }

  @override
  Users createAlias(String alias) {
    return Users(attachedDatabase, alias);
  }

  @override
  bool get isStrict => true;
}

class UsersData extends DataClass implements Insertable<UsersData> {
  final String id;
  final String username;
  final String email;
  final String password;
  final String role;
  final String posts;
  final String comments;
  final String tournaments;
  const UsersData({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
    required this.posts,
    required this.comments,
    required this.tournaments,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<String>(id);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['role'] = Variable<String>(role);
    map['posts'] = Variable<String>(posts);
    map['comments'] = Variable<String>(comments);
    map['tournaments'] = Variable<String>(tournaments);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      email: Value(email),
      password: Value(password),
      role: Value(role),
      posts: Value(posts),
      comments: Value(comments),
      tournaments: Value(tournaments),
    );
  }

  factory UsersData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersData(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      role: serializer.fromJson<String>(json['role']),
      posts: serializer.fromJson<String>(json['posts']),
      comments: serializer.fromJson<String>(json['comments']),
      tournaments: serializer.fromJson<String>(json['tournaments']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'role': serializer.toJson<String>(role),
      'posts': serializer.toJson<String>(posts),
      'comments': serializer.toJson<String>(comments),
      'tournaments': serializer.toJson<String>(tournaments),
    };
  }

  UsersData copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
    String? role,
    String? posts,
    String? comments,
    String? tournaments,
  }) => UsersData(
    id: id ?? this.id,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    role: role ?? this.role,
    posts: posts ?? this.posts,
    comments: comments ?? this.comments,
    tournaments: tournaments ?? this.tournaments,
  );
  UsersData copyWithCompanion(UsersCompanion data) {
    return UsersData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      role: data.role.present ? data.role.value : this.role,
      posts: data.posts.present ? data.posts.value : this.posts,
      comments: data.comments.present ? data.comments.value : this.comments,
      tournaments:
          data.tournaments.present ? data.tournaments.value : this.tournaments,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('posts: $posts, ')
          ..write('comments: $comments, ')
          ..write('tournaments: $tournaments')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    username,
    email,
    password,
    role,
    posts,
    comments,
    tournaments,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersData &&
          other.id == this.id &&
          other.username == this.username &&
          other.email == this.email &&
          other.password == this.password &&
          other.role == this.role &&
          other.posts == this.posts &&
          other.comments == this.comments &&
          other.tournaments == this.tournaments);
}

class UsersCompanion extends UpdateCompanion<UsersData> {
  final Value<String> id;
  final Value<String> username;
  final Value<String> email;
  final Value<String> password;
  final Value<String> role;
  final Value<String> posts;
  final Value<String> comments;
  final Value<String> tournaments;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.role = const Value.absent(),
    this.posts = const Value.absent(),
    this.comments = const Value.absent(),
    this.tournaments = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String username,
    required String email,
    required String password,
    this.role = const Value.absent(),
    required String posts,
    required String comments,
    required String tournaments,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       username = Value(username),
       email = Value(email),
       password = Value(password),
       posts = Value(posts),
       comments = Value(comments),
       tournaments = Value(tournaments);
  static Insertable<UsersData> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? role,
    Expression<String>? posts,
    Expression<String>? comments,
    Expression<String>? tournaments,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (role != null) 'role': role,
      if (posts != null) 'posts': posts,
      if (comments != null) 'comments': comments,
      if (tournaments != null) 'tournaments': tournaments,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? username,
    Value<String>? email,
    Value<String>? password,
    Value<String>? role,
    Value<String>? posts,
    Value<String>? comments,
    Value<String>? tournaments,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      posts: posts ?? this.posts,
      comments: comments ?? this.comments,
      tournaments: tournaments ?? this.tournaments,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (posts.present) {
      map['posts'] = Variable<String>(posts.value);
    }
    if (comments.present) {
      map['comments'] = Variable<String>(comments.value);
    }
    if (tournaments.present) {
      map['tournaments'] = Variable<String>(tournaments.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('posts: $posts, ')
          ..write('comments: $comments, ')
          ..write('tournaments: $tournaments, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final Users users = Users(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
  @override
  int get schemaVersion => 2;
}
