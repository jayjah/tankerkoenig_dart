// ignore_for_file: avoid_dynamic_calls

part of 'models.dart';

/// Statistic data class
///   Holds specific statistic types in a list
class Statistic {
  final List<StatisticType> stats;
  const Statistic(this.stats);
  factory Statistic.fromJson(dynamic json) {
    return Statistic(StatType.values.map<StatisticType>((StatType e) {
      switch (e) {
        case StatType.diesel:
          return StatisticType(
            e,
            json['Diesel']['count'] as int,
            json['Diesel']['mean'] as double,
            json['Diesel']['median'] as double,
          );
        case StatType.e5:
          return StatisticType(
            e,
            json['E5']['count'] as int,
            json['E5']['mean'] as double,
            json['E5']['median'] as double,
          );
        case StatType.e10:
          return StatisticType(
            e,
            json['E10']['count'] as int,
            json['E10']['mean'] as double,
            json['E10']['median'] as double,
          );
      }
    }).toList(growable: false));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Statistic &&
          runtimeType == other.runtimeType &&
          stats == other.stats;

  @override
  int get hashCode => stats.hashCode;

  @override
  String toString() => 'Statistic{stats: $stats}';
}

enum StatType { diesel, e5, e10 }

/// Represent a single statistic
class StatisticType {
  final StatType name;
  final int count;
  final double mean;
  final double median;
  const StatisticType(this.name, this.count, this.mean, this.median);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatisticType &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          count == other.count &&
          mean == other.mean &&
          median == other.median;

  @override
  int get hashCode =>
      name.hashCode ^ count.hashCode ^ mean.hashCode ^ median.hashCode;

  @override
  String toString() =>
      'StatisticType{name: $name, count: $count, mean: $mean, median: $median}';
}
