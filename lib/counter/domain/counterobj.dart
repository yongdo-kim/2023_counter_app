import 'package:hive/hive.dart';

part 'counterobj.g.dart';

@HiveType(typeId: 3)
class CounterObjectHive {
  @HiveField(0)
  int id;
  @HiveField(1)
  int count;
  @HiveField(2)
  String title;

  CounterObjectHive({
    required this.id,
    required this.count,
    required this.title,
  });

  CounterObjectHive copyWith({int? id, int? count, String? title}) {
    return CounterObjectHive(
        id: id ?? this.id,
        count: count ?? this.count,
        title: title ?? this.title);
  }
}
