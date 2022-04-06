import 'package:tankerkoenig_dart/tankerkoenig_dart.dart';
import 'package:test/test.dart';

import 'dart:io' show Platform;

void main() {
  group('Calendarific API Test', () {
    final dynamic apiKey = Platform.environment['API_KEY'];

    setUp(() {
      assert(apiKey != null,
          'ApiKey `API_KEY` from environment NOT readable or NOT available!');
    });

    test('API Test', () async {});
  });
}
