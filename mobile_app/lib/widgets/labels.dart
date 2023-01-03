/* flutter */
import 'package:flutter/material.dart';
import 'package:mobile_app/constants/colors.dart';

class Labels extends StatelessWidget {
  const Labels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          const Text(
            'No account yet?',
            style:
                TextStyle(color: Colors.black38, fontWeight: FontWeight.w500),
          ),
          TextButton(
              onPressed: () {},
              child: Text('Sign up',
                  style:
                      TextStyle(color: Color(colors[Palette.primary] as int))))
        ],
      ),
    );
  }
}
