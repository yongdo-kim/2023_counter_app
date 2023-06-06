import 'package:counter2023/common/firebase/firebase_setup.dart';
import 'package:counter2023/counter/presentation/counterPage.dart';
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      navigatorObservers: [FirebaseSetUp.getAnalytics()],
      home: const CounterApp(),
    );
  }
}
