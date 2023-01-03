/* flutter */
import 'package:flutter/material.dart';
/* widgets */
import 'package:mobile_app/widgets/custom_input.dart';
/* types */
import 'package:mobile_app/constants/colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          const CustomInput(),
          const SizedBox(height: 16),
          const CustomInput(),
          const SizedBox(height: 16),
          MaterialButton(
            onPressed: () {},
            color: Color(colors[Palette.primary] as int),
            child: const Text(
              'Sign in',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
