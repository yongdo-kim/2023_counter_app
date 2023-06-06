import 'package:counter2023/common/firebase/firebase_setup.dart';
import 'package:counter2023/common/injectable/injectable.dart';
import 'package:counter2023/counter/presentation/init.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseSetUp.init();
  configureDependencies();
  runApp(const InitPage());
}
