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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'createdAt',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updatedAt',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
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
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
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
    requiredDuringInsert: true,
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
    createdAt,
    updatedAt,
    username,
    email,
    password,
    image,
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
            data['${effectivePrefix}id'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}createdAt'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updatedAt'],
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
      image:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image'],
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
  final DateTime createdAt;
  final DateTime updatedAt;
  final String username;
  final String email;
  final String password;
  final String image;
  final String role;
  final String posts;
  final String comments;
  final String tournaments;
  const UsersData({
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['createdAt'] = Variable<DateTime>(createdAt);
    map['updatedAt'] = Variable<DateTime>(updatedAt);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['image'] = Variable<String>(image);
    map['role'] = Variable<String>(role);
    map['posts'] = Variable<String>(posts);
    map['comments'] = Variable<String>(comments);
    map['tournaments'] = Variable<String>(tournaments);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      username: Value(username),
      email: Value(email),
      password: Value(password),
      image: Value(image),
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
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      image: serializer.fromJson<String>(json['image']),
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
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'image': serializer.toJson<String>(image),
      'role': serializer.toJson<String>(role),
      'posts': serializer.toJson<String>(posts),
      'comments': serializer.toJson<String>(comments),
      'tournaments': serializer.toJson<String>(tournaments),
    };
  }

  UsersData copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? username,
    String? email,
    String? password,
    String? image,
    String? role,
    String? posts,
    String? comments,
    String? tournaments,
  }) => UsersData(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    image: image ?? this.image,
    role: role ?? this.role,
    posts: posts ?? this.posts,
    comments: comments ?? this.comments,
    tournaments: tournaments ?? this.tournaments,
  );
  UsersData copyWithCompanion(UsersCompanion data) {
    return UsersData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      image: data.image.present ? data.image.value : this.image,
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
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('image: $image, ')
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
    createdAt,
    updatedAt,
    username,
    email,
    password,
    image,
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
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.username == this.username &&
          other.email == this.email &&
          other.password == this.password &&
          other.image == this.image &&
          other.role == this.role &&
          other.posts == this.posts &&
          other.comments == this.comments &&
          other.tournaments == this.tournaments);
}

class UsersCompanion extends UpdateCompanion<UsersData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> username;
  final Value<String> email;
  final Value<String> password;
  final Value<String> image;
  final Value<String> role;
  final Value<String> posts;
  final Value<String> comments;
  final Value<String> tournaments;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.image = const Value.absent(),
    this.role = const Value.absent(),
    this.posts = const Value.absent(),
    this.comments = const Value.absent(),
    this.tournaments = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String username,
    required String email,
    required String password,
    required String image,
    required String role,
    required String posts,
    required String comments,
    required String tournaments,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       username = Value(username),
       email = Value(email),
       password = Value(password),
       image = Value(image),
       role = Value(role),
       posts = Value(posts),
       comments = Value(comments),
       tournaments = Value(tournaments);
  static Insertable<UsersData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? image,
    Expression<String>? role,
    Expression<String>? posts,
    Expression<String>? comments,
    Expression<String>? tournaments,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'createdAt': createdAt,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (image != null) 'image': image,
      if (role != null) 'role': role,
      if (posts != null) 'posts': posts,
      if (comments != null) 'comments': comments,
      if (tournaments != null) 'tournaments': tournaments,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? username,
    Value<String>? email,
    Value<String>? password,
    Value<String>? image,
    Value<String>? role,
    Value<String>? posts,
    Value<String>? comments,
    Value<String>? tournaments,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      image: image ?? this.image,
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
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['createdAt'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<DateTime>(updatedAt.value);
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
    if (image.present) {
      map['image'] = Variable<String>(image.value);
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
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('image: $image, ')
          ..write('role: $role, ')
          ..write('posts: $posts, ')
          ..write('comments: $comments, ')
          ..write('tournaments: $tournaments, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV4 extends GeneratedDatabase {
  DatabaseAtV4(QueryExecutor e) : super(e);
  late final Users users = Users(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
  @override
  int get schemaVersion => 4;
}
