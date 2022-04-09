// ignore_for_file: avoid_dynamic_calls

part of 'models.dart';

/// Station data class
class Station {
  final String name;
  final String street;
  final String postalCode;
  final String place;
  final String id;
  final String country;
  final String brand;
  final DateTime? closesAt;
  final DateTime? opensAt;
  final List<Fuel> fuels;
  const Station({
    required this.name,
    required this.street,
    required this.postalCode,
    required this.place,
    required this.id,
    required this.brand,
    required this.country,
    this.closesAt,
    this.opensAt,
    required this.fuels,
  });

  factory Station.fromJson(dynamic json) {
    final dynamic closeTime = json['closesAt'];
    final dynamic openTime = json['opensAt'];

    return Station(
      name: json['name'] as String,
      street: json['street'] as String,
      postalCode: json['postalCode'] as String,
      place: json['place'] as String,
      id: json['id'] as String,
      brand: json['brand'] as String,
      country: json['country'] as String,
      closesAt: closeTime == null ? null : DateTime.parse(closeTime as String),
      opensAt: openTime == null ? null : DateTime.parse(openTime as String),
      fuels: Fuel.fromJsonList(json['fuels']).toList(growable: false),
    );
  }

  static Iterable<Station>? fromJsonList(dynamic json) {
    final dynamic stations = json['stations'];

    if (stations is List) {
      return stations.map<Station>(Station.fromJson);
    }

    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Station &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          street == other.street &&
          postalCode == other.postalCode &&
          place == other.place &&
          id == other.id &&
          country == other.country &&
          closesAt == other.closesAt &&
          opensAt == other.opensAt &&
          fuels == other.fuels;

  @override
  int get hashCode =>
      name.hashCode ^
      street.hashCode ^
      postalCode.hashCode ^
      place.hashCode ^
      id.hashCode ^
      country.hashCode ^
      closesAt.hashCode ^
      opensAt.hashCode ^
      fuels.hashCode;

  @override
  String toString() =>
      'Station{name: $name, street: $street, postalCode: $postalCode, place: $place, id: $id, country: $country, closesAt: $closesAt, opensAt: $opensAt, fuels: $fuels}';
}
