/* flutter */
import 'package:flutter/widgets.dart';
/* pages */
import 'package:mobile_app/pages/loading_page.dart';
import 'package:mobile_app/pages/login_page.dart';
import 'package:mobile_app/pages/register_page.dart';
import 'package:mobile_app/pages/users_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'loading': (_) => const LoadingPage(),
  'login': (_) => const LoginPage(),
  'register': (_) => const RegisterPage(),
  'users': (_) => const UsersPage(),
  'chat': (_) => const LoadingPage()
};
