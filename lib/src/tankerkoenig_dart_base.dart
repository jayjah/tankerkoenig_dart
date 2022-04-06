import 'package:tankerkoenig_dart/src/models/models.dart';

/// Basic interface class for tankerkoenig api
abstract class TankerKoenigDartApi {
  Future<List<Station>?> getStationsByLatLng({
    required double latitude,
    required double longitude,
    int radius = 10,
  });
  Future<List<Station>?> getStationsByPostalCode({required int postalCode});
  Future<Statistic> getStatistics();

  Exception getExceptionFromResponse(int statusCode) {
    switch (statusCode) {
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
        return TankerKoenigException('API Unknown error', statusCode);
    }
  }
}
