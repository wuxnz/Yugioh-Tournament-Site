// Sign Up
import 'dart:convert';
import 'dart:typed_data';

import 'package:backend/backend.dart';
import 'package:backend/features/account/auth/token_auth.dart';
import 'package:backend/models/discrete_user.dart';
import 'package:backend/models/user.dart';
import 'package:aescryptojs/aescryptojs.dart';
import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

class AccountAuth {
  final TokenMiddleware tokenMiddleware = TokenMiddleware();

  String secretKey =
      sha256.convert(utf8.encode("${env["APP_ACCOUNT_SECRET"]}")).toString();

  // Generate Default PFP
  String generateDefaultPFP() {
    return "https://api.dicebear.com/7.x/pixel-art/png?seed=${Uuid().v4()}&background=%23000000";
  }

  // Encrypt Password
  String encryptAccountInfo(String password) {
    var enc = encryptAESCryptoJS(utf8.encode(password).toString(), secretKey);
    return enc;
  }

  // Decrypt Password
  String decryptAccountInfo(String passwordDigest) {
    var dec = utf8.decode(
      Uint8List.fromList(
        decryptAESCryptoJS((passwordDigest), secretKey).codeUnits,
      ),
    );
    return dec;
  }

  Future<Map<String, dynamic>> signUp(UserModel userInfo) async {
    if (db == null) {
      throw Exception("Database not initialized");
    }

    var user = await db!.findUserById(userInfo.id);

    if (user != null) {
      return {"error": "Can't create an account with these credentials"};
    }

    // var securedEmail = encryptAccountInfo(userInfo.email);
    var securedPassword = encryptAccountInfo(userInfo.password);

    var securedUser = UserModel.fromJson({
      ...userInfo.toJson(),
      // 'email': securedEmail,
      'password': securedPassword,
    });

    var newUser = await db!.addNewUser(user: securedUser);

    if (newUser == null) {
      return {'error': 'Error while creating account, please try again later.'};
    } else {
      return {
        'status': 'success',
        'message': 'Account created successfully',
        'data': newUser.toJson(),
      };
    }
  }

  // Sign In
  Future<Map<String, dynamic>> signIn(String email, String password) async {
    if (db == null) {
      throw Exception("Database not initialized");
    }

    var user = await db!.findUserByEmail(email);

    if (user == null) {
      return {'error': "Invalid username or password"};
    }

    // check if password is correct
    if (decryptAccountInfo(user.password) != password) {
      return {'error': "Invalid username or password"};
    }

    // generate token
    var token = tokenMiddleware.generateToken(user.id);

    // generate refresh token
    var refreshToken = tokenMiddleware.generateRefreshToken(user.id);

    /// Only return discrete user data
    var discreteUser = DiscreteUser.fromJson(user.toJson());

    return {
      'status': 'success',
      'message': 'Sign in successful',
      'data': {
        'token': token['accessToken'],
        'refresh_token': refreshToken['refreshToken'],
        'user': discreteUser.toJson(),
      },
    };
  }
}
