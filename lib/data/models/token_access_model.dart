import 'dart:convert';

class TokenAccessModel {
  String? username;
  final String tokenAccess;
  TokenAccessModel({
    this.username,
    required this.tokenAccess,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'access_token': tokenAccess,
    };
  }

  factory TokenAccessModel.fromMap(Map<String, dynamic> map) {
    return TokenAccessModel(
      tokenAccess: map['access_token'],
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenAccessModel.fromJson(String source) =>
      TokenAccessModel.fromMap(json.decode(source));
}
