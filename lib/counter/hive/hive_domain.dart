
import 'package:counter2023/counter/domain/counterobj.dart';
import 'package:counter2023/counter/domain/setting.dart';
import 'package:hive/hive.dart';

class HiveDomain {
  Future<void> registerAllAdapter() async {
    Hive.registerAdapter(CounterObjectHiveAdapter());
    Hive.registerAdapter(SettingAdapter());
  }

  static Future<Box<CounterObjectHive>> get getCountObjBox async {
    final countObjBox = await Hive.openBox<CounterObjectHive>('countObjBox');
    return countObjBox;
  }

  static Future<Box<Setting>> get getSettingBox async {
    final settingBox = await Hive.openBox<Setting>('settingBox');
    return settingBox;
  }
}
