class Failure implements Exception {
  String? message;

  String get getMessage => message!;
}

class ServerError extends Failure {
  final String? message;

  ServerError({this.message});
}

class LoginError extends Failure {
  final String? message;

  LoginError({this.message});
}

class UnauthorizedError extends Failure {
  final String? message;

  UnauthorizedError({this.message});
}
