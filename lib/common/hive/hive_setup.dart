import 'package:counter2023/counter/hive/hive_domain.dart';
import 'package:hive_flutter/adapters.dart';

class HiveSetup {
  Future<void> init() async {
    await Hive.initFlutter();
    await registerAllAdapterAndOpenBoxes();
  }

  Future<void> registerAllAdapterAndOpenBoxes() async {
    //TODO : 공통부부문이 아니라서 따로 빼둠
    HiveDomain().registerAllAdapter();
  }
}
