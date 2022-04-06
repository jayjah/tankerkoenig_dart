import 'dart:io' show Platform;

import 'package:tankerkoenig_dart/tankerkoenig_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Tankerkoenig API Test', () {
    final dynamic apiKey = Platform.environment['API_KEY'];
    late TankerKoenigApi api;

    setUp(() {
      //  assert(apiKey != null,
      //      'ApiKey `API_KEY` from environment NOT readable or NOT available!');
      api = TankerKoenigApi(
          /*apiKey as String*/ 'c2e9b4de-1aa2-22eb-3284-a24b4cf1a9fd');
    });

    test('getStationsByLatLng Test', () async {
      final List<Station>? data = await api.getStationsByLatLng(
          latitude: 52.52099975265203, longitude: 13.43803882598877);
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getStationsByPostalCode Test', () async {
      final List<Station>? data =
          await api.getStationsByPostalCode(postalCode: 24558);
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getStatistics Test', () async {
      final Statistic data = await api.getStatistics();
      expect(data.stats, isNotEmpty);
      expect(
        true,
        data.stats
            .where((StatisticType element) => element.name == StatType.diesel)
            .isNotEmpty,
      );
      expect(
        true,
        data.stats
            .where((StatisticType element) => element.name == StatType.e5)
            .isNotEmpty,
      );
      expect(
        true,
        data.stats
            .where((StatisticType element) => element.name == StatType.e10)
            .isNotEmpty,
      );
    });
  });
}
