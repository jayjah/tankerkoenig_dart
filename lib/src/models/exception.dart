part of 'models.dart';

/// Exception class
class TankerKoenigException implements Exception {
  final String message;
  final int? code;
  final dynamic response;
  const TankerKoenigException([this.message = "", this.code, this.response]);
}
