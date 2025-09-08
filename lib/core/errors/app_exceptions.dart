abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  const AppException(this.message, {this.code, this.details});

  @override
  String toString() => 'AppException: $message';
}

class NetworkException extends AppException {
  const NetworkException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);

  @override
  String toString() => 'NetworkException: $message';
}

class ServerException extends AppException {
  const ServerException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);

  @override
  String toString() => 'ServerException: $message';
}

class CacheException extends AppException {
  const CacheException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);

  @override
  String toString() => 'CacheException: $message';
}

class AuthException extends AppException {
  const AuthException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);

  @override
  String toString() => 'AuthException: $message';
}

class ValidationException extends AppException {
  const ValidationException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);

  @override
  String toString() => 'ValidationException: $message';
}

class LocationException extends AppException {
  const LocationException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);

  @override
  String toString() => 'LocationException: $message';
}

class PaymentException extends AppException {
  const PaymentException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);

  @override
  String toString() => 'PaymentException: $message';
}

class OrderException extends AppException {
  const OrderException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);

  @override
  String toString() => 'OrderException: $message';
}

class PermissionException extends AppException {
  const PermissionException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);

  @override
  String toString() => 'PermissionException: $message';
}

class UnknownException extends AppException {
  const UnknownException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);

  @override
  String toString() => 'UnknownException: $message';
} 