abstract class Errors {}

class ClientHttpRequetError implements Errors {
  final String onRequestType;

  ClientHttpRequetError(this.onRequestType);
}

class ClientHttpRequestTypeError implements Errors {
  final String? message;

  ClientHttpRequestTypeError({
    this.message,
  });
}

class BadRequestError implements Errors {
  final String? message;

  BadRequestError({
    this.message,
  });
}

class UnauthorizedError implements Errors {
  final String? message;

  UnauthorizedError({
    this.message,
  });
}

class ForbiddenError implements Errors {
  final String? message;

  ForbiddenError({
    this.message,
  });
}

class NotFoundError implements Errors {
  final String? message;

  NotFoundError({
    this.message,
  });
}

class UnprocessableEntityError implements Errors {
  final String? message;

  UnprocessableEntityError({
    this.message,
  });
}

class ServerError implements Errors {
  final String? message;

  ServerError({
    this.message,
  });
}

class UnexpectedError implements Errors {
  final String? message;

  UnexpectedError({
    this.message,
  });
}
