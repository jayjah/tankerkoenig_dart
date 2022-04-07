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
            int.parse(json['Diesel']['count']!.toString()),
            double.parse(json['Diesel']['mean']!.toString()),
            double.parse(json['Diesel']['median']!.toString()),
          );
        case StatType.e5:
          return StatisticType(
            e,
            int.parse(json['E5']['count']!.toString()),
            double.parse(json['E5']['mean']!.toString()),
            double.parse(json['E5']['median']!.toString()),
          );
        case StatType.e10:
          return StatisticType(
            e,
            int.parse(json['E10']['count']!.toString()),
            double.parse(json['E10']['mean']!.toString()),
            double.parse(json['E10']['median']!.toString()),
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
