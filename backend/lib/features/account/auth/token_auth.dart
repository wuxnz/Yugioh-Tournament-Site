import 'dart:convert';

import 'package:backend/backend.dart';
import 'package:backend/models/user.dart';
import 'package:crypto/crypto.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:uuid/uuid.dart';

class TokenMiddleware {
  var appTokenSecret = env["APP_TOKEN_SECRET"]!;
  var appRefreshTokenSecret = env['APP_REFRESH_TOKEN_SECRET']!;

  // Generate Default PFP
  String generateDefaultPFP() {
    return "https://api.dicebear.com/7.x/pixel-art/png?seed=${Uuid().v4()}&background=%23000000";
  }

  String tokenSecretKey =
      sha256.convert(utf8.encode(TokenMiddleware().appTokenSecret)).toString();
  String refreshTokenSecretKey =
      sha256
          .convert(utf8.encode(TokenMiddleware().appRefreshTokenSecret))
          .toString();
  int minutesTillTokenExpiry = 5;
  int daysTillRefreshTokenExpiry = 7;

  // Generate Token
  Map<String, dynamic> generateToken(String userId) {
    var jwt = JWT({"id": userId});
    var tokenInfo = {
      "token": jwt.sign(
        SecretKey(tokenSecretKey),
        expiresIn: Duration(minutes: minutesTillTokenExpiry),
      ),
    };
    return tokenInfo;
  }

  // Generate Refresh Token
  Map<String, dynamic> generateRefreshToken(String userId) {
    var jwt = JWT({"id": userId});
    var tokenInfo = {
      "refresh_token": jwt.sign(
        SecretKey(refreshTokenSecretKey),
        expiresIn: Duration(days: daysTillRefreshTokenExpiry),
      ),
    };
    return tokenInfo;
  }

  // Verify Token
  bool verifyToken(String token) {
    try {
      JWT.verify(token, SecretKey(tokenSecretKey));
      return true;
    } on JWTExpiredException {
      return false;
    } catch (err) {
      return false;
    }
  }

  // Verify Refresh Token
  bool verifyRefreshToken(String token) {
    try {
      JWT.verify(token, SecretKey(refreshTokenSecretKey));
      return true;
    } on JWTExpiredException {
      return false;
    } catch (err) {
      return false;
    }
  }

  // Decode Token
  UserModel? decodeToken(String token) {
    if (db == null) {
      return null;
    }

    var jwt = JWT.verify(token, SecretKey(tokenSecretKey));

    db!.findUserById(jwt.payload["id"]).then((user) {
      if (user == null) {
        throw Exception("User not found");
      }

      return user;
    });
    return null;
  }

  // Refresh Token
  Map<String, dynamic> refreshToken(String refreshToken) {
    if (db == null) {
      return {};
    }

    if (!(verifyRefreshToken(refreshToken))) {
      return {"error": "Unauthorized"};
    }

    var jwt = JWT.verify(refreshToken, SecretKey(refreshTokenSecretKey));
    db!.findUserById(jwt.payload["id"]).then((user) {
      if (user == null) {
        return {"error": "Invalid Credentials"};
      }

      var newToken = generateToken(user.id);
      var newRefreshToken = generateRefreshToken(user.id);

      return {
        "status": "success",
        "message": "Token refreshed",
        "data": {
          "token": newToken["token"],
          "refresh_token": newRefreshToken["refresh_token"],
        },
      };
    });

    return {"error": "User not found"};
  }
}
