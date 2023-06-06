import 'package:counter2023/counter/domain/counter.dart';
import 'package:hive/hive.dart';

class HiveDomain {
  Future<void> registerAllAdapter() async {
    Hive.registerAdapter(CountAdapter());
  }

  Future<void> openAllBoxes() async {
    await Hive.openBox<Count>('countBox');
  }
}
