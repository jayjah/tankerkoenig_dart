// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:tankerkoenig_dart/src/client/client.dart';
import 'package:tankerkoenig_dart/src/models/models.dart';
import 'package:tankerkoenig_dart/src/tankerkoenig_dart_base.dart';

/// Basic implementation class for tankerkoenig api of [TankerKoenigDartApi]
class TankerKoenigApi extends TankerKoenigDartApi {
  final String _apiKey;
  final TankerKoenigClient _client;

  TankerKoenigApi(this._apiKey)
      : _client = TankerKoenigClient.create(ChopperClient());

  /// Retrieve gas stations by given [latitude] and [longitude]. Those values
  ///   must be provided.
  ///   [radius] indicates radius in km around given coordinates.
  ///
  /// It may throw a [TankerKoenigException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Station>?> stationsByLatLng({
    required double latitude,
    required double longitude,
    int radius = 10,
  }) async {
    final Response<dynamic> response = await _client.getStationsByLatLng(
      _apiKey,
      latitude,
      longitude,
      radius,
    );

    if (response.statusCode != 200) {
      throw exceptionFromResponse(response.statusCode);
    }

    return Station.fromJsonList(jsonDecode(response.bodyString));
  }

  /// Retrieve gas stations by given [postalCode]. Those value
  ///   must be provided.
  ///
  /// It may throw a [TankerKoenigException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Station>?> stationsByPostalCode(
      {required int postalCode}) async {
    final Response<dynamic> response =
        await _client.getStationsByPostalCode(_apiKey, postalCode);

    if (response.statusCode != 200) {
      throw exceptionFromResponse(response.statusCode);
    }

    return Station.fromJsonList(jsonDecode(response.bodyString));
  }

  /// Retrieve statistics about gas types. These are normally `Diesel`, `E5`
  ///   and `E10`.
  ///
  /// It may throw a [TankerKoenigException] error on API error.
  @override
  Future<Statistic> statistics() async {
    final Response<dynamic> response = await _client.getStatistics(_apiKey);

    if (response.statusCode != 200) {
      throw exceptionFromResponse(response.statusCode);
    }

    return Statistic.fromJson(
      jsonDecode(
        response.bodyString,
      ),
    );
  }

  /// Retrieve gas station by given [id].
  ///
  /// It may throw a [TankerKoenigException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Station?> stationById({required String id}) async {
    assert(id.isNotEmpty, 'Provided id must not be empty!');

    final Response<dynamic> response = await _client.getStationsByIds(
      _apiKey,
      <String>[id],
    );

    if (response.statusCode != 200) {
      throw exceptionFromResponse(response.statusCode);
    }

    return Station.fromJsonList(jsonDecode(response.bodyString))?.first;
  }

  /// Retrieve gas stations by given [ids].
  ///
  /// It may throw a [TankerKoenigException] error on API error.
  ///
  /// It may return [Null] on unexpected parse error.
  @override
  Future<Iterable<Station>?> stationsByIds({required List<String> ids}) async {
    assert(ids.isNotEmpty, 'Provided ids must not be empty!');

    final Response<dynamic> response =
        await _client.getStationsByIds(_apiKey, ids);

    if (response.statusCode != 200) {
      throw exceptionFromResponse(response.statusCode);
    }

    return Station.fromJsonList(jsonDecode(response.bodyString));
  }
}
