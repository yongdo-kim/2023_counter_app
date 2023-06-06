import 'package:counter2023/counter/domain/counter.dart';
import 'package:hive/hive.dart';

class HiveDomain {
  Future<void> registerAllAdapter() async {
    Hive.registerAdapter(CountAdapter());
  }

  static Future<Box<Count>> get getCountBox async {
    final countBox = await Hive.openBox<Count>('countBox');
    return countBox;
  }
}
