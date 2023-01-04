/* flutter */
import 'package:flutter/material.dart';
/* models */
import 'package:mobile_app/models/message.dart';
/* types */
import 'package:mobile_app/constants/palette.dart';

class ChatMessage extends StatefulWidget {
  final MessageListItem message;

  const ChatMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationCtrl;

  late final Animation<double> _animation;

  @override
  void initState() {
    _animationCtrl = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _animation =
        CurvedAnimation(parent: _animationCtrl, curve: Curves.easeInOut);

    _animationCtrl.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SizeTransition(
        sizeFactor: _animation,
        child: Align(
          alignment: widget.message.isOwn
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.only(
                left: widget.message.isOwn ? 32 : 8,
                right: widget.message.isOwn ? 8 : 32,
              ),
              decoration: BoxDecoration(
                color:
                    widget.message.isOwn ? Palette.primary : Palette.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                widget.message.text,
                style: const TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
