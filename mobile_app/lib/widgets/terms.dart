/* flutter */
import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: TextButton(
          onPressed: () {},
          child: const Text(
            'Terms and conditions of use',
            style: TextStyle(color: Colors.black38),
          )),
    );
  }
}
