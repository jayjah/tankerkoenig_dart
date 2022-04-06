// ignore_for_file: avoid_dynamic_calls

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
            StatType.diesel,
            json['Diesel']['count'] as int,
            json['Diesel']['mean'] as double,
            json['Diesel']['median'] as double,
          );
        case StatType.e5:
          return StatisticType(
            StatType.e5,
            json['E5']['count'] as int,
            json['E5']['mean'] as double,
            json['E5']['median'] as double,
          );
        case StatType.e10:
          return StatisticType(
            StatType.e10,
            json['E10']['count'] as int,
            json['E10']['mean'] as double,
            json['E10']['median'] as double,
          );
      }
    }).toList(growable: false));
  }
}

enum StatType { diesel, e5, e10 }

/// Represent a single statistic
class StatisticType {
  final StatType name;
  final int count;
  final double mean;
  final double median;
  const StatisticType(this.name, this.count, this.mean, this.median);
}
