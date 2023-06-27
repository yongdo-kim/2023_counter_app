import 'package:counter2023/counter/application/counter/counter_bloc.dart';
import 'package:counter2023/counter/application/setting/setting_bloc.dart';
import 'package:counter2023/counter/presentation/settingPage.dart';
import 'package:counter2023/counter/presentation/widget/counterContent.dart';
import 'package:counter2023/counter/presentation/widget/pageDot.dart';
import 'package:counter2023/design/appbar/nari_app_bar.dart';
import 'package:counter2023/design/color/nari_color.dart';
import 'package:counter2023/design/font/nari_font.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/admob/interstitial.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(
      initialPage: 0,
    );

    return Scaffold(
      appBar: NariAppBar(
        title: tr('title'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.gear,
                  color: NariColor.primaryBlack,
                  size: 32,
                ),
                onPressed: () async {
                  await Interstitial(adLoadCallback: (value) {
                    if (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const SettingPage();
                        }),
                      );
                    }
                  }).loadAd();
                }),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, settingState) {
            return BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const Text(
                      "옆으로 이동할 수 있어요! 🚀",
                      style: NariFont.bold16,
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: PageView.builder(
                              onPageChanged: (value) {
                                context
                                    .read<CounterBloc>()
                                    .add(CounterIndexChanged(index: value));
                              },
                              itemCount: state.counterObjects.length,
                              itemBuilder: (context, index) {
                                return CounterContent(
                                  index: index,
                                );
                              })),
                    ),
                    const PageDot()
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
