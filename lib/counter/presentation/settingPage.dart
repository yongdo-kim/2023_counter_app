import 'package:counter2023/design/appbar/nari_app_bar.dart';
import 'package:counter2023/design/color/nari_color.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NariColor.primaryWhite,
      appBar: const NariAppBar(
        title: '환경설정',
        actions: [],
      ),
      body: SafeArea(child: Container()),
    );
  }
}
