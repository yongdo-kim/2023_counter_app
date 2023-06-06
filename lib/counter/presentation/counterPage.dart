import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:counter2023/common/injectable/injectable.dart';
import 'package:counter2023/counter/application/counter_bloc.dart';
import 'package:counter2023/counter/presentation/settingPage.dart';
import 'package:counter2023/design/button/nari_button.dart';
import 'package:counter2023/design/font/nari_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.gear,
                color: Colors.grey,
                size: 32,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingPage()),
                );
              }),
        ],
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<CounterBloc>(),
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  AnimatedFlipCounter(
                      value: state.count,
                      textStyle: NariFont.bold.copyWith(
                        fontSize: 64,
                        color: Colors.black,
                      )),
                  Expanded(child: Container()),
                  NariButton(
                    width: 256,
                    height: 256,
                    iconData: FontAwesomeIcons.plus,
                    iconSize: 64,
                    backgroundColor: Colors.white,
                    onTap: () {
                      context.read<CounterBloc>().add(const CounterUp());
                    },
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
