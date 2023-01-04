/* flutter */
import 'package:flutter/material.dart';
/* types */
import 'package:mobile_app/constants/palette.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput(
      {Key? key,
      required this.icon,
      required this.placeholder,
      required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false})
      : super(key: key);

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
        keyboardType: keyboardType,
        controller: textController,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.primary,
          ),
          border: InputBorder.none,
          hintText: placeholder,
        ),
      ),
    );
  }
}
