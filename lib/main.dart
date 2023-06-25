import 'dart:async';

import 'package:counter2023/common/firebase/firebase_setup.dart';
import 'package:counter2023/common/hive/hive_setup.dart';
import 'package:counter2023/common/injectable/injectable.dart';
import 'package:counter2023/counter/application/counter/counter_bloc.dart';
import 'package:counter2023/counter/application/setting/setting_bloc.dart';
import 'package:counter2023/counter/presentation/init.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize(); //에드몹
  await EasyLocalization.ensureInitialized(); //다국화
  await FirebaseSetUp.init(); //파이어베이스
  await HiveSetup().init(); //로컬Db
  configureDependencies(); //injection
  runZonedGuarded(() {
    //최상위로 멀티프로바이더 써서 바로바로 사용할 수 있도록 변경
    runApp(EasyLocalization(
      supportedLocales: const [
        Locale('de', 'DE'),
        Locale('en', 'US'),
        Locale('es', 'AR'),
        Locale('hi', 'IN'),
        Locale('ja', 'JP'),
        Locale('ko', 'KR'),
        Locale('pt', 'BR'),
        Locale('ru', 'RU'),
        Locale('zh', 'CN'),
      ],
      fallbackLocale: const Locale('en', 'US'),

      path:
          'resources/langs', //flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc()..add(const CounterStarted()),
          ),
          BlocProvider<SettingBloc>(
            create: (context) => SettingBloc()..add(const SettingInit()),
          ),
        ],
        child: const InitPage(),
      ),
    ));
  }, (error, strackTrace) {
    FirebaseSetUp.setCrashlytics();
  });
}
