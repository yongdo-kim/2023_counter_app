import 'package:counter2023/counter/domain/counter.dart';
import 'package:counter2023/counter/domain/setting.dart';
import 'package:hive/hive.dart';

class HiveDomain {
  Future<void> registerAllAdapter() async {
    Hive.registerAdapter(CountAdapter()); // 새로운 하이브는 여기에 저장한다.
    Hive.registerAdapter(SettingAdapter());
  }

  static Future<Box<Count>> get getCountBox async {
    final countBox = await Hive.openBox<Count>('countBox');
    return countBox;
  }

  static Future<Box<Setting>> get getSettingBox async {
    final settingBox = await Hive.openBox<Setting>('settingBox');
    return settingBox;
  }
}
