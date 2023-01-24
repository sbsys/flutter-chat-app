/* flutter */
import 'package:flutter/material.dart';
/* constants */
import 'package:mobile_app/constants/palette.dart';

showAlert(BuildContext context, String title, String subtitle) => showDialog(
    context: context,
    builder: ((context) => AlertDialog(
          title: Text(title),
          content: Text(subtitle),
          actions: <Widget>[
            MaterialButton(
              onPressed: (() => Navigator.pop(context)),
              elevation: 2,
              textColor: Palette.primary,
              child: const Text('Ok'),
            )
          ],
        )));
