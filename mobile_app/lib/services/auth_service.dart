/* flutter */
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/models/auth.dart';
import 'package:mobile_app/models/response.dart';
/* models */
import 'package:mobile_app/models/user.dart';
/* env */
import 'package:mobile_app/env/env.dart';

class AuthService with ChangeNotifier {
  late User user;

  bool _isSignInProcess = false;
  bool get isSignInProcess => _isSignInProcess;
  set isSignInProcess(bool value) {
    _isSignInProcess = value;
    notifyListeners();
  }

  final _storage = const FlutterSecureStorage();

  Future<bool> signIn(String email, String password) async {
    isSignInProcess = true;

    final data = {'email': email.trim(), 'password': password.trim()};

    try {
      final response = await http.post(
        Env.getURL('/auth/sign-in'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 5));

      if (response.statusCode != 200) {
        isSignInProcess = false;

        return false;
      }

      final signInResponse =
          responseFromJson(response.body, AuthResponseFactory());

      user = signInResponse.data.user;

      await _storeToken(signInResponse.data.token);

      isSignInProcess = false;

      return true;
    } catch (e) {
      isSignInProcess = false;

      return false;
    }
  }

  Future _storeToken(String token) async =>
      await _storage.write(key: 'token', value: token);

  /* Future _removeToken() async => await _storage.delete(key: 'token'); */

  static Future<String> getToken() async {
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');

    return token ?? '';
  }
}
