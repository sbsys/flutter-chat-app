class UserListItem {
  String id;
  String name;
  String email;
  bool online;

  UserListItem({
    required this.id,
    required this.name,
    required this.email,
    required this.online,
  });

  factory UserListItem.fromMap(Map<String, dynamic> obj) => UserListItem(
        id: obj['id'],
        name: obj['name'],
        email: obj['votes'],
        online: obj['online'],
      );
}
