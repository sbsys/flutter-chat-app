/* flutter */
import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/alert.dart';
import 'package:provider/provider.dart';
/* widgets */
import 'package:mobile_app/widgets/logo.dart';
/* services */
import 'package:mobile_app/services/auth_service.dart';
import 'package:mobile_app/services/socket_service.dart';
/* constants */
import 'package:mobile_app/constants/palette.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkSignInState(context),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Palette.bg,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.only(left: 32, right: 32),
                height: MediaQuery.of(context).size.height * 0.95,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Logo(title: ''),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future _checkSignInState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context, listen: false);

    final auth = await authService.signInByToken();

    if (!auth.status) {
      // ignore: use_build_context_synchronously
      showAlert(context, 'No authenticated', auth.message);

      // ignore: use_build_context_synchronously
      return Navigator.pushReplacementNamed(context, 'login');
    }

    socketService.connect();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, 'users');
  }
}
