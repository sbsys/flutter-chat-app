/* flutter */
import 'package:flutter/material.dart';
/* types */
import 'package:mobile_app/constants/palette.dart';

class Logo extends StatelessWidget {
  final String title;

  const Logo({Key? key, this.title = 'Flutter Chat'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 48),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            const Icon(
              Icons.chat,
              size: 160,
              color: Palette.primary,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
