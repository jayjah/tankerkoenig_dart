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
  final double latitude;
  final double longitude;
  final String? brand;
  final DateTime? closesAt;
  final DateTime? opensAt;
  final Iterable<Fuel> fuels;
  const Station({
    required this.name,
    required this.street,
    required this.postalCode,
    required this.place,
    required this.id,
    required this.brand,
    required this.country,
    required this.fuels,
    required this.longitude,
    required this.latitude,
    this.closesAt,
    this.opensAt,
  });

  double get e10Price {
    try {
      return fuels
          .firstWhere(
              (Fuel element) => element.name.toLowerCase().trim() == 'supere10')
          .price;
    } on StateError {
      return 0.0;
    }
  }

  double get e5Price {
    try {
      return fuels
          .firstWhere(
              (Fuel element) => element.name.toLowerCase().trim() == 'supere5')
          .price;
    } on StateError {
      return 0.0;
    }
  }

  double get dieselPrice {
    try {
      return fuels
          .firstWhere(
              (Fuel element) => element.name.toLowerCase().trim() == 'diesel')
          .price;
    } on StateError {
      return 0.0;
    }
  }

  factory Station.fromJson(final dynamic json) {
    final dynamic closeTime = json?['closesAt'];
    final dynamic openTime = json?['opensAt'];

    return Station(
      name: json['name'] as String,
      street: json['street'] as String,
      longitude: json['coords']['lng'] as double,
      latitude: json['coords']['lat'] as double,
      postalCode: json['postalCode'] as String,
      place: json['place'] as String,
      id: json['id'] as String,
      brand: json['brand'] as String?,
      country: json['country'] as String,
      closesAt: closeTime == null ? null : DateTime.parse(closeTime as String),
      opensAt: openTime == null ? null : DateTime.parse(openTime as String),
      fuels: Fuel.listFromJson(json['fuels']),
    );
  }

  static Iterable<Station>? listFromJson(final dynamic json) {
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
          hashCode == other.hashCode;

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
