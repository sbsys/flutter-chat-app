/* flutter */
import 'package:flutter/material.dart';
/* widgets */
import 'package:mobile_app/widgets/logo.dart';
import 'package:mobile_app/widgets/login_form.dart';
import 'package:mobile_app/widgets/labels.dart';
import 'package:mobile_app/widgets/terms.dart';
/* types */
import 'package:mobile_app/constants/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(colors[Palette.bg] as int),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Logo(),
              LoginForm(),
              Labels(),
              Terms(),
            ],
          ),
        ),
      ),
    );
  }
}
