/* flutter */
import 'package:flutter/material.dart';
/* types */
import 'package:mobile_app/constants/palette.dart';

class CustomButton extends StatelessWidget {
  final Color fillColor;
  final Color textColor;
  final void Function() onPressed;
  final String text;
  final bool isLoading;

  const CustomButton({
    Key? key,
    this.fillColor = Palette.primary,
    this.textColor = Colors.white,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isLoading ? () {} : onPressed,
      color: isLoading ? Colors.grey : fillColor,
      elevation: isLoading ? 0 : 2,
      shape: const StadiumBorder(),
      child: SizedBox(
        width: double.infinity,
        height: 46,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
