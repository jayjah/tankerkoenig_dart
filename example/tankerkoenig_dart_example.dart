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
