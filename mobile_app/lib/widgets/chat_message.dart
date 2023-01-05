/* flutter */
import 'package:flutter/material.dart';
/* models */
import 'package:mobile_app/models/message.dart';
/* types */
import 'package:mobile_app/constants/palette.dart';

class ChatMessage extends StatelessWidget {
  final MessageListItem message;
  final AnimationController animCtrl;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.animCtrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animCtrl, curve: Curves.easeOut),
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animCtrl, curve: Curves.easeOut),
        child: Align(
          alignment:
              message.isOwn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.only(
                left: message.isOwn ? 32 : 8,
                right: message.isOwn ? 8 : 32,
              ),
              decoration: BoxDecoration(
                color: message.isOwn ? Palette.primary : Palette.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message.text,
                style: const TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
