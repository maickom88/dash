class Failure implements Exception {
  String? message;

  String get getMessage => message!;
}

class ServerError extends Failure {
  final String? message;

  ServerError({this.message});
}
