import 'dart:async';

import 'package:counter2023/common/firebase/firebase_setup.dart';
import 'package:counter2023/common/hive/hive_setup.dart';
import 'package:counter2023/common/injectable/injectable.dart';
import 'package:counter2023/counter/presentation/init.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseSetUp.init();
  await HiveSetup().init();
  configureDependencies();
  runZonedGuarded(() {
    runApp(const InitPage());
  }, (error, strackTrace) {
    FirebaseSetUp.setCrashlytics();
  });
}
