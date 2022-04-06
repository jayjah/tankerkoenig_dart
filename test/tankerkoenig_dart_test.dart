import 'dart:io' show Platform;

import 'package:test/test.dart';

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
