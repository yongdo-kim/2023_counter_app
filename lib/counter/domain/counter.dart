import 'package:hive/hive.dart';

part 'counter.g.dart';

@HiveType(typeId: 1)
class Count {
  @HiveField(0)
  int number;
  Count({
    required this.number,
  });

  Count copyWith({
    int? number,
  }) {
    return Count(
      number: number ?? this.number,
    );
  }
}
