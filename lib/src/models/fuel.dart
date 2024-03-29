// ignore_for_file: avoid_dynamic_calls

part of 'models.dart';

/// Fuel data class
class Fuel {
  final String name;
  final String category;
  final double price;
  final LastChange lastChange;
  const Fuel({
    required this.name,
    required this.category,
    required this.price,
    required this.lastChange,
  });

  factory Fuel.fromJson(final dynamic json) => Fuel(
        name: json['name'] as String,
        category: json['category'] as String,
        price: json['price'] as double,
        lastChange: LastChange.fromJson(json['lastChange']),
      );

  static Iterable<Fuel> listFromJson(final dynamic json) {
    if (json is List) {
      return json.map<Fuel>(Fuel.fromJson);
    }

    return const <Fuel>[];
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fuel &&
          runtimeType == other.runtimeType &&
          hashCode == other.hashCode;

  @override
  int get hashCode =>
      name.hashCode ^ category.hashCode ^ price.hashCode ^ lastChange.hashCode;

  @override
  String toString() =>
      'Fuel{name: $name, category: $category, price: $price, lastChange: $lastChange}';
}
