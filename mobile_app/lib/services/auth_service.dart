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
  late User? user;

  bool _isSignUpProcess = false;
  bool get isSignUpProcess => _isSignUpProcess;
  set isSignUpProcess(bool value) {
    _isSignUpProcess = value;
    notifyListeners();
  }

  bool _isSignInProcess = false;
  bool get isSignInProcess => _isSignInProcess;
  set isSignInProcess(bool value) {
    _isSignInProcess = value;
    notifyListeners();
  }

  final _storage = const FlutterSecureStorage();

  Future<Response<User>> signUp(
      String name, String email, String password) async {
    isSignUpProcess = true;

    final data = {
      'name': name.trim(),
      'email': email.trim(),
      'password': password.trim()
    };

    try {
      final response = await http.post(
        Env.getURL('/auth/sign-up'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 5));

      final signUpResponse = responseFromJson(response.body, UserFactory());

      isSignUpProcess = false;

      return signUpResponse;
    } catch (e) {
      isSignUpProcess = false;

      return Response(
        status: false,
        message: e.toString(),
        data: UserFactory().fromJson({}),
      );
    }
  }

  Future<Response<AuthResponse>> signIn(String email, String password) async {
    isSignInProcess = true;

    final data = {'email': email.trim(), 'password': password.trim()};

    try {
      final response = await http.post(
        Env.getURL('/auth/sign-in'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 5));

      final signInResponse =
          responseFromJson(response.body, AuthResponseFactory());

      user = signInResponse.data.user;

      if (response.statusCode == 200) {
        await _storeToken(signInResponse.data.token);
      }

      isSignInProcess = false;

      return signInResponse;
    } catch (e) {
      isSignInProcess = false;

      return Response(
        status: false,
        message: e.toString(),
        data: AuthResponseFactory().fromJson({}),
      );
    }
  }

  Future<Response<AuthResponse>> signInByToken() async {
    try {
      final token = await getToken();

      if (token.isEmpty) {
        return Response(
          status: false,
          message: 'Your session has expired',
          data: AuthResponseFactory().fromJson({}),
        );
      }

      final response = await http.get(
        Env.getURL('/auth/sign-in'),
        headers: {
          'Content-Type': 'application/json',
          'x-token': token,
        },
      ).timeout(const Duration(seconds: 5));

      final signInByTokenResponse =
          responseFromJson(response.body, AuthResponseFactory());

      user = signInByTokenResponse.data.user;

      if (response.statusCode == 200) {
        await _storeToken(signInByTokenResponse.data.token);
      }

      return signInByTokenResponse;
    } catch (e) {
      return Response(
        status: false,
        message: e.toString(),
        data: AuthResponseFactory().fromJson({}),
      );
    }
  }

  Future signOut() async {
    user = null;
    await _removeToken();
  }

  Future _storeToken(String token) async =>
      await _storage.write(key: 'token', value: token);

  Future _removeToken() async => await _storage.delete(key: 'token');

  static Future<String> getToken() async {
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');

    return token ?? '';
  }
}
