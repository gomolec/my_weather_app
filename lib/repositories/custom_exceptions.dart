class CustomException implements Exception {
  final String prefix;
  final dynamic message;

  const CustomException(this.prefix, [this.message = ""]);

  @override
  String toString() {
    return "$prefix: $message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([message]) : super("Error During Communication", message);
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super("Invalid Request", message);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super("Unauthorised", message);
}

class InvalidInputException extends CustomException {
  InvalidInputException([message]) : super("Invalid Input", message);
}

class WrongLocalizationException extends CustomException {
  WrongLocalizationException([message]) : super("Wrong localization", message);
}
