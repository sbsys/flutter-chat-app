/* flutter */
import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/alert.dart';
import 'package:provider/provider.dart';
/* widgets */
import 'package:mobile_app/widgets/custom_input.dart';
import 'package:mobile_app/widgets/custom_button.dart';
/* services */
import 'package:mobile_app/services/auth_service.dart';
/* types */
import 'package:mobile_app/constants/palette.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.perm_identity_outlined,
            placeholder: 'Name',
            textController: nameCtrl,
          ),
          const SizedBox(height: 16),
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          const SizedBox(height: 16),
          CustomInput(
            icon: Icons.lock_outlined,
            placeholder: 'Password',
            textController: passCtrl,
            isPassword: true,
          ),
          const SizedBox(height: 16),
          CustomInput(
            icon: Icons.sync_lock_outlined,
            placeholder: 'Confirm password',
            textController: confirmCtrl,
            isPassword: true,
          ),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () async {
              FocusScope.of(context).unfocus();

              if (passCtrl.text.trim() != confirmCtrl.text.trim()) {
                return showAlert(
                    context, 'No account', 'Password and confirm must mach');
              }

              final auth = await authService.signUp(
                  nameCtrl.text, emailCtrl.text, passCtrl.text);

              if (!auth.status) {
                // ignore: use_build_context_synchronously
                return showAlert(context, 'No account', auth.message);
              }

              // ignore: use_build_context_synchronously
              showAlert(context, 'Account created', auth.message);

              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, 'login');
            },
            text: 'Sign up',
            fillColor: Palette.secondary,
            isLoading: authService.isSignUpProcess,
          ),
        ],
      ),
    );
  }
}
