/* flutter */
import 'package:flutter/material.dart';
/* types */
import 'package:mobile_app/constants/colors.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 48),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Icon(
              Icons.chat,
              size: 160,
              color: Color(colors[Palette.primary] as int),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Flutter Chat',
              style: TextStyle(fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
