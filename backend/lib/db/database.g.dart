// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    '_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
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
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant('user'),
  );
  static const VerificationMeta _postsMeta = const VerificationMeta('posts');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> posts =
      GeneratedColumn<String>(
        'posts',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($UsersTable.$converterposts);
  static const VerificationMeta _commentsMeta = const VerificationMeta(
    'comments',
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> comments =
      GeneratedColumn<String>(
        'comments',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($UsersTable.$convertercomments);
  static const VerificationMeta _tournamentsMeta = const VerificationMeta(
    'tournaments',
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
  tournaments = GeneratedColumn<String>(
    'tournaments',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<List<String>>($UsersTable.$convertertournaments);
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
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    context.handle(_postsMeta, const VerificationResult.success());
    context.handle(_commentsMeta, const VerificationResult.success());
    context.handle(_tournamentsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
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
      posts: $UsersTable.$converterposts.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}posts'],
        )!,
      ),
      comments: $UsersTable.$convertercomments.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}comments'],
        )!,
      ),
      tournaments: $UsersTable.$convertertournaments.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tournaments'],
        )!,
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterposts =
      StringListTypeConverter();
  static TypeConverter<List<String>, String> $convertercomments =
      StringListTypeConverter();
  static TypeConverter<List<String>, String> $convertertournaments =
      StringListTypeConverter();
  @override
  bool get isStrict => true;
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String username;
  final String email;
  final String password;
  final String role;
  final List<String> posts;
  final List<String> comments;
  final List<String> tournaments;
  const User({
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
    {
      map['posts'] = Variable<String>($UsersTable.$converterposts.toSql(posts));
    }
    {
      map['comments'] = Variable<String>(
        $UsersTable.$convertercomments.toSql(comments),
      );
    }
    {
      map['tournaments'] = Variable<String>(
        $UsersTable.$convertertournaments.toSql(tournaments),
      );
    }
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

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      role: serializer.fromJson<String>(json['role']),
      posts: serializer.fromJson<List<String>>(json['posts']),
      comments: serializer.fromJson<List<String>>(json['comments']),
      tournaments: serializer.fromJson<List<String>>(json['tournaments']),
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
      'posts': serializer.toJson<List<String>>(posts),
      'comments': serializer.toJson<List<String>>(comments),
      'tournaments': serializer.toJson<List<String>>(tournaments),
    };
  }

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
    String? role,
    List<String>? posts,
    List<String>? comments,
    List<String>? tournaments,
  }) => User(
    id: id ?? this.id,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    role: role ?? this.role,
    posts: posts ?? this.posts,
    comments: comments ?? this.comments,
    tournaments: tournaments ?? this.tournaments,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
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
    return (StringBuffer('User(')
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
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.email == this.email &&
          other.password == this.password &&
          other.role == this.role &&
          other.posts == this.posts &&
          other.comments == this.comments &&
          other.tournaments == this.tournaments);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> username;
  final Value<String> email;
  final Value<String> password;
  final Value<String> role;
  final Value<List<String>> posts;
  final Value<List<String>> comments;
  final Value<List<String>> tournaments;
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
    required List<String> posts,
    required List<String> comments,
    required List<String> tournaments,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       username = Value(username),
       email = Value(email),
       password = Value(password),
       posts = Value(posts),
       comments = Value(comments),
       tournaments = Value(tournaments);
  static Insertable<User> custom({
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
    Value<List<String>>? posts,
    Value<List<String>>? comments,
    Value<List<String>>? tournaments,
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
      map['posts'] = Variable<String>(
        $UsersTable.$converterposts.toSql(posts.value),
      );
    }
    if (comments.present) {
      map['comments'] = Variable<String>(
        $UsersTable.$convertercomments.toSql(comments.value),
      );
    }
    if (tournaments.present) {
      map['tournaments'] = Variable<String>(
        $UsersTable.$convertertournaments.toSql(tournaments.value),
      );
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      required String username,
      required String email,
      required String password,
      Value<String> role,
      required List<String> posts,
      required List<String> comments,
      required List<String> tournaments,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> username,
      Value<String> email,
      Value<String> password,
      Value<String> role,
      Value<List<String>> posts,
      Value<List<String>> comments,
      Value<List<String>> tournaments,
      Value<int> rowid,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get posts => $composableBuilder(
    column: $table.posts,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get comments => $composableBuilder(
    column: $table.comments,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get tournaments => $composableBuilder(
    column: $table.tournaments,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posts => $composableBuilder(
    column: $table.posts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comments => $composableBuilder(
    column: $table.comments,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tournaments => $composableBuilder(
    column: $table.tournaments,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get posts =>
      $composableBuilder(column: $table.posts, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get comments =>
      $composableBuilder(column: $table.comments, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tournaments =>
      $composableBuilder(
        column: $table.tournaments,
        builder: (column) => column,
      );
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
          User,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<List<String>> posts = const Value.absent(),
                Value<List<String>> comments = const Value.absent(),
                Value<List<String>> tournaments = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                username: username,
                email: email,
                password: password,
                role: role,
                posts: posts,
                comments: comments,
                tournaments: tournaments,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String username,
                required String email,
                required String password,
                Value<String> role = const Value.absent(),
                required List<String> posts,
                required List<String> comments,
                required List<String> tournaments,
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                username: username,
                email: email,
                password: password,
                role: role,
                posts: posts,
                comments: comments,
                tournaments: tournaments,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
      User,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
}
