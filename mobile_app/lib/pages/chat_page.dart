/* flutter */
import 'package:flutter/material.dart';
/* widgets */
import 'package:mobile_app/widgets/chat_message.dart';
/* models */
import 'package:mobile_app/models/message.dart';
/* types */
import 'package:mobile_app/constants/palette.dart';

class Message {
  MessageListItem message;
  AnimationController animCtrl;

  Message({required this.message, required this.animCtrl});
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _messageCtrl = TextEditingController();
  final _focusNode = FocusNode();

  bool _hasText = false;

  final List<Message> _messages = [];

  @override
  void dispose() {
    for (var message in _messages) {
      message.animCtrl.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.bg,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
          title: const Text('José Moncada',
              style: TextStyle(
                color: Colors.black54,
              )),
          actions: <Widget>[
            Center(
              child: Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: false ? Palette.primary : Palette.accent,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Palette.bg,
        body: Column(
          children: <Widget>[
            Flexible(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) => ChatMessage(
                      message: _messages[index].message,
                      animCtrl: _messages[index].animCtrl,
                    )),
                separatorBuilder: (context, index) => Container(height: 8),
                reverse: true,
                itemCount: _messages.length,
              ),
            ),
            const Divider(),
            _chatInput(),
          ],
        ),
      ),
    );
  }

  Widget _chatInput() => Container(
        margin: const EdgeInsets.all(8),
        child: Row(children: <Widget>[
          Flexible(
            child: TextField(
              onSubmitted: _handleSubmitted,
              onChanged: (value) => setState(() =>
                  value.trim().isEmpty ? _hasText = false : _hasText = true),
              autocorrect: false,
              keyboardType: TextInputType.text,
              maxLines: 8,
              minLines: 1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Write a message',
              ),
              controller: _messageCtrl,
              focusNode: _focusNode,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.send_outlined,
              color: _hasText ? Palette.primary : Colors.black45,
            ),
            onPressed:
                _hasText ? () => _handleSubmitted(_messageCtrl.text) : null,
          )
        ]),
      );

  _handleSubmitted(String value) {
    if (value.trim().isEmpty) return _focusNode.requestFocus();

    _messageCtrl.clear();
    _focusNode.requestFocus();

    AnimationController animCtrl = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _messages.insert(
      0,
      Message(
        message: MessageListItem(
          id: '${_messages.length + 1}',
          text: value.trim(),
          isOwn: (_messages.length + 1) % 2 == 0,
        ),
        animCtrl: animCtrl,
      ),
    );

    animCtrl.forward();

    setState(() {
      _hasText = false;
    });
  }
}
