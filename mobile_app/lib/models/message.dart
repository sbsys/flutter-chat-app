class MessageListItem {
  String id;
  String text;
  bool isOwn;

  MessageListItem({
    required this.id,
    required this.text,
    required this.isOwn,
  });

  factory MessageListItem.fromMap(Map<String, dynamic> obj) => MessageListItem(
        id: obj['id'],
        text: obj['text'],
        isOwn: obj['isOwn'],
      );
}
