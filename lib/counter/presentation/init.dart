import 'package:counter2023/common/firebase/firebase_setup.dart';
import 'package:counter2023/counter/presentation/counterPage.dart';
import 'package:counter2023/design/color/nari_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: NariColor.primaryBlack),
          ),
        ),
        title: 'Counter',
        navigatorObservers: [FirebaseSetUp.getAnalytics()],
        home: const CounterApp());
  }
}
