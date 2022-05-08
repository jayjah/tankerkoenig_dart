import 'dart:io' show Platform;

import 'package:tankerkoenig_dart/tankerkoenig_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Tankerkoenig API Test', () {
    final dynamic apiKey = Platform.environment['API_KEY'];
    late TankerKoenigApi api;

    setUp(() {
      assert(apiKey != null,
          'ApiKey `API_KEY` from environment NOT readable or NOT available!');
      api = TankerKoenigApi(apiKey as String);
    });

    test('getStationsByLatLng Test', () async {
      final Iterable<Station>? data = await api.stationsByLatLng(
        latitude: 52.52099975265203,
        longitude: 13.43803882598877,
      );
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getStationsByPostalCode Test', () async {
      final Iterable<Station>? data =
          await api.stationsByPostalCode(postalCode: 24558);
      expect(data, isNotNull);
      expect(data, isNotEmpty);
    });

    test('getStationById Test', () async {
      const String id = '92f703e8-0b3c-46da-9948-25cb1a6a1514';
      final Station? data = await api.stationById(id: id);
      expect(data, isNotNull);
      expect(true, id == data!.id);
    });

    test('getStationsByIds Test', () async {
      const List<String> ids = <String>[
        '92f703e8-0b3c-46da-9948-25cb1a6a1514',
        '83d5ac80-4f23-4106-b054-7c7704bfcb95',
      ];

      final Iterable<Station>? data = await api.stationsByIds(ids: ids);
      expect(data, isNotNull);
      expect(data, isNotEmpty);
      expect(data!.length, ids.length);
      expect(
        true,
        data.where((Station element) => element.id == ids.first).isNotEmpty,
      );
      expect(
        true,
        data.where((Station element) => element.id == ids.last).isNotEmpty,
      );
    });

    test('getStatistics Test', () async {
      final Statistic data = await api.statistics();
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
