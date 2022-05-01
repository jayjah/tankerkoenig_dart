// ignore_for_file: avoid_dynamic_calls

part of 'models.dart';

// LastChange data class
class LastChange {
  final double amount;
  final DateTime timeStamp;
  const LastChange({
    required this.amount,
    required this.timeStamp,
  });

  factory LastChange.fromJson(dynamic json) => LastChange(
        amount: json['amount'] as double,
        timeStamp: DateTime.parse(json['timestamp'] as String),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LastChange &&
          runtimeType == other.runtimeType &&
          amount == other.amount &&
          timeStamp == other.timeStamp;

  @override
  int get hashCode => amount.hashCode ^ timeStamp.hashCode;

  @override
  String toString() => 'LastChange{amount: $amount, timeStamp: $timeStamp}';
}
