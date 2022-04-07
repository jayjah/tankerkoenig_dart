// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$TankerKoenigClient extends TankerKoenigClient {
  _$TankerKoenigClient([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TankerKoenigClient;

  @override
  Future<Response<dynamic>> getStationsByLatLng(
      String apiKey, double latitude, double longitude, int radius) {
    final $url =
        'https://creativecommons.tankerkoenig.de/api/v4/stations/search?lat=${latitude}&lng=${longitude}&rad=${radius}&apikey=${apiKey}';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getStationsByPostalCode(
      String apiKey, int postalCode) {
    final $url =
        'https://creativecommons.tankerkoenig.de/api/v4/stations/postalcode?postalcode=${postalCode}&apikey=${apiKey}';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getStationsByIds(String apiKey, List<String> ids) {
    String idsStr = '';
    for (int i = 0; i < ids.length; i++) {
      if (i + 1 < ids.length)
        idsStr += '${ids[i]},';
      else
        idsStr += '${ids[i]}';
    }
    final $url =
        'https://creativecommons.tankerkoenig.de/api/v4/stations/ids?ids=${idsStr}&apikey=${apiKey}';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getStatistics(String apiKey) {
    final $url =
        'https://creativecommons.tankerkoenig.de/api/v4/stats?apikey=${apiKey}';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
