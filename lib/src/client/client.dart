import 'package:chopper/chopper.dart';

part 'client.chopper.dart';

/// TankerKoenig Rest Client abstraction
@ChopperApi(baseUrl: "https://creativecommons.tankerkoenig.de/api/v4")
abstract class TankerKoenigClient extends ChopperService {
  static TankerKoenigClient create(ChopperClient dio) =>
      _$TankerKoenigClient(dio);

  @Get(
    path: "/stations/search?lat={lat}&lng={lng}&rad={rad}&apikey={api_key}",
    headers: <String, String>{"Content-Type": "application/json"},
  )
  Future<Response<dynamic>> getStationsByLatLng(
    @Path('api_key') String apiKey,
    @Path('lat') double latitude,
    @Path('lng') double longitude,
    @Path('rad') int radius,
  );

  @Get(
    path: "/stations/postalcode?postalcode={postalcode}&apikey={api_key}",
    headers: <String, String>{"Content-Type": "application/json"},
  )
  Future<Response<dynamic>> getStationsByPostalCode(
    @Path('api_key') String apiKey,
    @Path('postalcode') int postalCode,
  );

  @Get(
    path: "/stats?apikey={api_key}",
    headers: <String, String>{"Content-Type": "application/json"},
  )
  Future<Response<dynamic>> getStatistics(
    @Path('api_key') String apiKey,
  );
}
