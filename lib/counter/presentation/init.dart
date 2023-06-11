import 'package:counter2023/common/firebase/firebase_setup.dart';
import 'package:counter2023/counter/presentation/counterPage.dart';
import 'package:counter2023/design/color/nari_color.dart';
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: NariColor.primaryBlack),
        ),
      ),
      title: 'Counter',
      navigatorObservers: [FirebaseSetUp.getAnalytics()],
      home: const CounterApp(),
    );
  }
}
