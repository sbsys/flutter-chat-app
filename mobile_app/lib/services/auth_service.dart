/* flutter */
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
/* models */
import 'package:mobile_app/models/user.dart';
/* env */
import 'package:mobile_app/env/env.dart';

class AuthService with ChangeNotifier {
  Future signIn(String email, String password) async {
    final data = {'email': email, 'password': password};

    final response = await http.post(
      Env.getURL('/auth/sign-in'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    print(response.body);
  }
}
