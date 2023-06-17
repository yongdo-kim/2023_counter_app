import 'dart:async';

import 'package:counter2023/common/firebase/firebase_setup.dart';
import 'package:counter2023/common/hive/hive_setup.dart';
import 'package:counter2023/common/injectable/injectable.dart';
import 'package:counter2023/counter/application/counter/counter_bloc.dart';
import 'package:counter2023/counter/application/setting/setting_bloc.dart';
import 'package:counter2023/counter/presentation/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseSetUp.init();
  await HiveSetup().init();
  configureDependencies();
  runZonedGuarded(() {
    //최상위로 멀티프로바이더 써서 바로바로 사용할 수 있도록 변경 
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc()..add(const CounterStarted()),
        ),
        BlocProvider<SettingBloc>(
          create: (context) => SettingBloc()..add(const SettingInit()),
        ),
      ],
      child: const InitPage(),
    ));
  }, (error, strackTrace) {
    FirebaseSetUp.setCrashlytics();
  });
}
