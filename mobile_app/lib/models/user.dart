/* models */
import 'package:mobile_app/models/response.dart';

class User {
  String id;
  String name;
  String email;
  bool online;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.online,
  });
}

class UserFactory extends Factory<User> {
  @override
  User fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        online: json["online"] ?? false,
      );

  @override
  Map<String, dynamic> toJson(User? obj) {
    if (obj == null) return {};

    return {
      "id": obj.id,
      "name": obj.name,
      "email": obj.email,
      "online": obj.online,
    };
  }
}
