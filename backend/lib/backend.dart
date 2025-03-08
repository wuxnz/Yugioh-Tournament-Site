import 'dart:convert';

import 'package:backend/features/account/auth/auth.dart';
import 'package:backend/models/user.dart';
import 'package:dotenv/dotenv.dart';
import 'dart:io';

import 'package:alfred/alfred.dart';
import 'package:backend/db/database.dart';
import 'package:backend/features/account/auth/token_auth.dart';
import 'package:uuid/uuid.dart';

Future<void> authorizedRequest(HttpRequest req, HttpResponse res) async {
  var auth = req.headers.value("Authorization");
  if (auth == null) {
    res.statusCode = 401;
    res.write("Unauthorized");
    return;
  }

  var tokenAuth = TokenMiddleware();

  String? token;
  try {
    token = auth.split(" ")[1];
  } catch (err) {
    res.statusCode = 401;
    res.write("Unauthorized");
    return;
  }

  try {
    bool validToken = tokenAuth.verifyToken(token);
    if (!validToken) {
      res.statusCode = 401;
      res.write("Unauthorized");
      return;
    }
  } catch (err) {
    res.statusCode = 401;
    res.write("Unauthorized");
    return;
  }

  return;
}

Future<void> authorizedRefreshRequest(HttpRequest req, HttpResponse res) async {
  var auth = req.headers.value("Authorization");
  if (auth == null) {
    res.statusCode = 401;
    res.write("Unauthorized");
    return;
  }

  var tokenAuth = TokenMiddleware();

  String? token;
  try {
    token = auth.split(" ")[1];
  } catch (err) {
    res.statusCode = 401;
    res.write("Unauthorized");
    return;
  }

  try {
    bool validToken = tokenAuth.verifyRefreshToken(token);
    if (!validToken) {
      res.statusCode = 401;
      res.write("Unauthorized");
      return;
    }
  } catch (err) {
    res.statusCode = 401;
    res.write("Unauthorized");
    return;
  }

  return;
}

var env = DotEnv(includePlatformEnvironment: false)..load();

AppDatabase? db;

Future<void> start() async {
  final app = Alfred();
  final port = 8080;
  final apiPrefix = '/api/v1';

  app.get(apiPrefix, (req, res) {
    res.headers.contentType = ContentType.json;
    return {"message": "Hello World!"};
  });

  /// Auth routes
  /// Sign up
  app.post("$apiPrefix/account/auth/signup", (req, res) async {
    res.headers.contentType = ContentType.json;
    var accountFeatures = AccountAuth();
    var body = await req.bodyAsJsonMap;
    try {
      var result = await accountFeatures.signUp(
        UserModel(
          id: Uuid().v4(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          username: body['username'],
          email: body['email'],
          password: body["password"],
          image: AccountAuth().generateDefaultPFP(),
          role: Role.user,
          posts: [],
          comments: [],
          tournaments: [],
        ),
      );
      if (result["error"]) {
        res.statusCode = 403;
        res.write(result["error"]);
        return;
      }
      res.send(json.encode(result));
    } catch (err) {
      res.statusCode = 400;
      res.write("Bad request");
      return;
    }
  });

  // Sign in
  app.post("$apiPrefix/account/auth/signin", (req, res) async {
    res.headers.contentType = ContentType.json;
    var accountFeatures = AccountAuth();
    var body = await req.bodyAsJsonMap;
    try {
      var result = await accountFeatures.signIn(
        body["email"],
        body["password"],
      );
      if (result["error"]) {
        res.statusCode = 403;
        res.write(result["error"]);
        return;
      }
      res.send(json.encode(result));
    } catch (err) {
      print(err);
      res.statusCode = 400;
      res.write("Bad request");
      return;
    }
  });

  // Refresh token
  app.post("$apiPrefix/account/auth/refreshToken", (req, res) async {
    var body = await req.bodyAsJsonMap;

    var refreshToken = body["refreshToken"];

    res.headers.contentType = ContentType.json;

    try {
      var result = TokenMiddleware().refreshToken(refreshToken);
      if (result["error"]) {
        res.statusCode = 401;
        res.write(result["error"]);
        return;
      }
      res.send(json.encode(result));
    } catch (err) {
      print(err);
      res.statusCode = 400;
      res.write("Bad request, refresh token not valid");
      return;
    }
  }, middleware: [authorizedRequest]);

  print("Iinitializing Database");
  db = AppDatabase();

  await app.listen(port);
}
