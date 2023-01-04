/* flutter */
import 'package:flutter/material.dart';
/* routes */
import 'package:mobile_app/routes/routes.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat',
      initialRoute: 'chat',
      routes: routes,
    );
  }
}
