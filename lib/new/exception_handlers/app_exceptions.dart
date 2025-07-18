class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix $_message';
  }
}

class CustomException implements Exception {
  final String message;
  CustomException(this.message);

  @override
  String toString() {
    return 'CustomException: $message';
  }
}