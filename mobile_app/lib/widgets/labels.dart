/* flutter */
import 'package:flutter/material.dart';
import 'package:mobile_app/constants/palette.dart';

class Labels extends StatelessWidget {
  final String route;

  const Labels({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            route == 'register'
                ? 'No account yet?'
                : 'Do you already have an account?',
            style: const TextStyle(
                color: Colors.black38, fontWeight: FontWeight.w500),
          ),
          TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, route),
              child: Text(route == 'register' ? 'Sign up' : 'Sign in',
                  style: const TextStyle(color: Palette.primary)))
        ],
      ),
    );
  }
}
