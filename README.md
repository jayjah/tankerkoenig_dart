<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

![Dart](https://img.shields.io/badge/Dart-2.18.4-green)
[![pub](https://img.shields.io/pub/v/tankerkoenig_dart.svg)](https://pub.dev/packages/tankerkoenig_dart)

A dart package to retrieve germans gas stations and gas prices from tankerkoenig v4 API.

## Features

- retrieve gas stations by postal code, latitude and longitude or by given id
- retrieve gas price statistics

## Usage

```
import 'package:tankerkoenig_dart/tankerkoenig_dart.dart';

Future<void> main() async {
  const String apiKey = '';
  final TankerKoenigApi api = TankerKoenigApi(apiKey);
  print(
      'Station by postal code: ${await api.stationsByPostalCode(postalCode: '24558')}');
  print(
      'Station by id: ${await api.stationById(id: '92f703e8-0b3c-46da-9948-25cb1a6a1514')}');
  print('Statistics: ${await api.statistics()}');
}
```

See `/example` or `/test` for usage information.
See `tankerkoenig.yaml` file for api reference.

## Additional information

[tankerkoenig Website](https://creativecommons.tankerkoenig.de)

[tankerkoenig API](https://creativecommons.tankerkoenig.de/swagger/)
