/* flutter */
import 'package:flutter/material.dart';
/* types */
import 'package:mobile_app/constants/colors.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              offset: const Offset(0, 4),
              blurRadius: 4,
            )
          ]),
      child: TextField(
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail_outline,
            color: Color(colors[Palette.primary] as int),
          ),
          border: InputBorder.none,
          hintText: 'Email',
        ),
      ),
    );
  }
}
