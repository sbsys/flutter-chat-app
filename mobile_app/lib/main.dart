/* flutter */
import 'package:flutter/material.dart';
import 'package:mobile_app/services/auth_service.dart';
import 'package:provider/provider.dart';
/* routes */
import 'package:mobile_app/routes/routes.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Chat',
        initialRoute: 'login',
        routes: routes,
      ),
    );
  }
}
