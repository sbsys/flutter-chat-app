/* flutter */
import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/alert.dart';
import 'package:provider/provider.dart';
/* widgets */
import 'package:mobile_app/widgets/custom_input.dart';
import 'package:mobile_app/widgets/custom_button.dart';
/* services */
import 'package:mobile_app/services/auth_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          const SizedBox(height: 16),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textController: passCtrl,
            isPassword: true,
          ),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () async {
              FocusScope.of(context).unfocus();

              final isAuth =
                  await authService.signIn(emailCtrl.text, passCtrl.text);

              if (isAuth) {
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'users');
              } else {
                // ignore: use_build_context_synchronously
                showAlert(
                    context, 'No authenticated', 'Verify your credentials');
              }
            },
            text: 'Sign in',
            isLoading: authService.isSignInProcess,
          ),
        ],
      ),
    );
  }
}
