import 'dart:io';

import 'package:alfred/alfred.dart';
import 'package:backend/db/converters/string_list_type_converter.dart';
import 'package:backend/db/database.dart';
import 'package:uuid/uuid.dart';

void main() async {
  final app = Alfred();
  final port = 8080;
  final apiPrefix = '/api/v1';

  app.get(apiPrefix, (req, res) {
    res.headers.contentType = ContentType.json;
    return {"message": "Hello World!"};
  });

  final database = AppDatabase();

  await database
      .into(database.users)
      .insert(
        UsersCompanion.insert(
          id: Uuid().v4(),
          username: "Shwampy",
          email: "fakemail@mail.com",
          password: "password",
          posts: [],
          comments: [],
          tournaments: [],
        ),
      );
  List<User> allUsers = await database.select(database.users).get();
  print("All users: $allUsers");

  // await database
  //     .into(database.todoItems)
  //     .insert(
  //       TodoItemsCompanion.insert(
  //         title: 'todo: finish drift setup',
  //         content: 'We can now write queries and define our own tables.',
  //       ),
  //     );
  // List<TodoItem> allItems = await database.select(database.todoItems).get();

  // print('items in database: $allItems');

  await app.listen(port);
}
