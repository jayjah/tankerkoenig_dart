// ignore_for_file: avoid_print

part of 'api.dart';

/// Basic implementation class for tankerkoenig api of [TankerKoenigDartApi]
class TankerKoenigApi extends TankerKoenigDartApi {
  final String _apiKey;
  final TankerKoenigClient _client;

  TankerKoenigApi(this._apiKey, {TankerKoenigClient? client})
      : assert(
            _apiKey.isNotEmpty, 'Provided api key must be a non empty string!'),
        _client = client ?? TankerKoenigClient.create(ChopperClient());

  /// Retrieve gas stations by given [latitude] and [longitude]. Those values
  ///   must be provided.
  ///   [radius] indicates radius in km around given coordinates.
  ///
  /// It may throw a [TankerKoenigException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Station>?> stationsByLatLng({
    required final double latitude,
    required final double longitude,
    final int radius = 10,
  }) async {
    assert(!latitude.isNaN && latitude.toString().isNotEmpty,
        'Provided latitude must be a valid double value! e.G. 53.223');
    assert(!longitude.isNaN && longitude.toString().isNotEmpty,
        'Provided longitude must be a valid double value! e.G. 53.223');
    assert(!radius.isNaN && radius.toString().isNotEmpty && radius >= 0,
        'Provided radius must be a valid int value and at least 0! e.G. 0,1,2,3,4,5,..');

    final Response<dynamic> response = await _client.getStationsByLatLng(
      _apiKey,
      latitude,
      longitude,
      radius,
    );

    if (response.statusCode != 200) {
      throw _exceptionFromResponse(response);
    }

    return Station.listFromJson(response.bodyString.asDecodedJson);
  }

  /// Retrieve gas stations by given [postalCode]. Those value
  ///   must be provided.
  ///
  /// It may throw a [TankerKoenigException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Station>?> stationsByPostalCode({
    required final int postalCode,
  }) async {
    assert(
        !postalCode.isNaN &&
            !postalCode.isNegative &&
            postalCode.toString().isNotEmpty,
        'Provided postalcode must be a positive number!');

    final Response<dynamic> response =
        await _client.getStationsByPostalCode(_apiKey, postalCode);

    if (response.statusCode != 200) {
      throw _exceptionFromResponse(response);
    }

    return Station.listFromJson(response.bodyString.asDecodedJson);
  }

  /// Retrieve statistics about gas types. These are normally `Diesel`, `E5`
  ///   and `E10`.
  ///
  /// It may throw a [TankerKoenigException] error on API error.
  @override
  Future<Statistic> statistics() async {
    final Response<dynamic> response = await _client.getStatistics(_apiKey);

    if (response.statusCode != 200) {
      throw _exceptionFromResponse(response);
    }

    return Statistic.fromJson(response.bodyString.asDecodedJson);
  }

  /// Retrieve gas station by given [id].
  ///
  /// It may throw a [TankerKoenigException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Station?> stationById({
    required final String id,
  }) async {
    assert(id.isNotEmpty, 'Provided id must not be empty!');

    final Response<dynamic> response = await _client.getStationsByIds(
      _apiKey,
      <String>[id],
    );

    if (response.statusCode != 200) {
      throw _exceptionFromResponse(response);
    }

    return Station.listFromJson(response.bodyString.asDecodedJson)?.first;
  }

  /// Retrieve gas stations by given [ids].
  ///
  /// It may throw a [TankerKoenigException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Station>?> stationsByIds({
    required final List<String> ids,
  }) async {
    assert(ids.isNotEmpty, 'Provided ids must not be empty!');

    final Response<dynamic> response =
        await _client.getStationsByIds(_apiKey, ids);

    if (response.statusCode != 200) {
      throw _exceptionFromResponse(response);
    }

    return Station.listFromJson(
      response.bodyString.asDecodedJson,
    );
  }
}
