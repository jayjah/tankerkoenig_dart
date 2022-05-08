import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:tankerkoenig_dart/src/models/models.dart';

extension JsonDecoder on String {
  dynamic get asDecodedJson => jsonDecode(this);
}

/// Basic interface class for tankerkoenig api
abstract class TankerKoenigDartApi {
  Future<Iterable<Station>?> stationsByLatLng({
    required double latitude,
    required double longitude,
    int radius = 10,
  });
  Future<Iterable<Station>?> stationsByPostalCode({required int postalCode});
  Future<Iterable<Station>?> stationsByIds({required List<String> ids});
  Future<Station?> stationById({required String id});
  Future<Statistic> statistics();

  Exception exceptionFromResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 400:
        return const TankerKoenigException(
          'Bad Request',
          400,
        );
      case 401:
        return const TankerKoenigException(
          'Unauthorized - invalid API key',
          401,
        );
      case 500:
        return const TankerKoenigException(
          'Internal Server Error',
          500,
        );
      case 503:
        return const TankerKoenigException(
          'Service Unavailable - rate limit exceeded',
          503,
        );
      default:
        return TankerKoenigException(
          'API Unknown error',
          response.statusCode,
          response,
        );
    }
  }
}
