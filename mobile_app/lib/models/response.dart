import 'dart:convert';

abstract class Factory<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T? obj);
}

class Response<T> {
  bool status;
  String message;
  T data;

  Response({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json, Factory<T> factory) =>
      Response(
        status: json['status'] ?? false,
        message: json['message'] ?? '',
        data: factory.fromJson(json['data']),
      );

  Map<String, dynamic> toJson(Factory<T> factory) => {
        "status": status,
        "message": message,
        "data": factory.toJson(data),
      };
}

Response<T> responseFromJson<T>(String str, Factory<T> factory) =>
    Response.fromJson(json.decode(str), factory);

String responseToJson<T>(Response<T> data, Factory<T> factory) =>
    json.encode(data.toJson(factory));
