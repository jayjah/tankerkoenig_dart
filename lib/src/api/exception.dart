part of 'api.dart';

/// Exception class
class TankerKoenigException implements Exception {
  final String message;
  final int? code;
  final Response<dynamic>? response;
  const TankerKoenigException([this.message = "", this.code, this.response]);

  @override
  String toString() =>
      'TankerKoenigException{message: $message, code: $code, ${response == null ? '' : 'response body: ${response!.bodyString}'}';
}
