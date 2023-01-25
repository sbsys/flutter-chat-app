/* models */
import 'package:mobile_app/models/response.dart';
import 'package:mobile_app/models/user.dart';

class AuthResponse {
  User user;
  String token;

  AuthResponse({
    required this.user,
    required this.token,
  });
}

class AuthResponseFactory extends Factory<AuthResponse> {
  @override
  AuthResponse fromJson(Map<String, dynamic>? json) {
    json ??= {};

    return AuthResponse(
      user: UserFactory().fromJson(json['user'] ?? {}),
      token: json['token'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(AuthResponse? obj) {
    if (obj == null) return {};

    return {
      'user': UserFactory().toJson(obj.user),
      'token': obj.token,
    };
  }
}
