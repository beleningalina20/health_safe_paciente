abstract class ApiException implements Exception {
  final String message;
  final String prefix;

  ApiException({required this.message, required this.prefix});

  @override
  String toString() {
    return '$prefix $message';
  }
}

class FetchDataException extends ApiException {
  final String msg;
  FetchDataException({this.msg = ''})
      : super(message: msg, prefix: 'Error During Communication');
}

class BadRequestException extends ApiException {
  final String msg;
  BadRequestException({this.msg = ''})
      : super(message: msg, prefix: 'Invalid request');
}

class UnauthorisedException extends ApiException {
  final String msg;
  UnauthorisedException({this.msg = ''})
      : super(message: msg, prefix: 'Unauthorised request');
}

class InvalidInputException extends ApiException {
  final String msg;

  InvalidInputException({this.msg = ''})
      : super(message: msg, prefix: 'Unauthorised Input');
}
