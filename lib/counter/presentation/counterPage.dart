import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:counter2023/counter/application/counter/counter_bloc.dart';
import 'package:counter2023/counter/application/setting/setting_bloc.dart';
import 'package:counter2023/counter/presentation/settingPage.dart';
import 'package:counter2023/design/appbar/nari_app_bar.dart';
import 'package:counter2023/design/button/nari_button.dart';
import 'package:counter2023/design/color/nari_color.dart';
import 'package:counter2023/design/font/nari_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NariAppBar(
        title: "Counter",
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.gear,
                  color: NariColor.primaryBlack,
                  size: 32,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage()),
                  );
                }),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<CounterBloc, CounterState>(
          listenWhen: (previous, current) => previous.count != current.count,
          listener: (context, state) async {
            await soundPlayer(context);
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  AnimatedFlipCounter(
                      duration: const Duration(milliseconds: 100),
                      value: state.count,
                      textStyle: NariFont.bold.copyWith(
                          fontSize: 120, color: NariColor.primaryBlack)),
                  Expanded(child: Container()),
                  NariButton(
                    width: 256,
                    height: 256,
                    iconData: FontAwesomeIcons.plus,
                    iconSize: 64,
                    backgroundColor: Colors.white,
                    onTap: () async {
                      context.read<CounterBloc>().add(const CounterUp());
                    },
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [CounterMinusBox(), CounterResetBox()],
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CounterMinusBox extends StatelessWidget {
  const CounterMinusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return NariButton(
      width: 100,
      backgroundColor: Colors.white,
      padding: EdgeInsets.zero,
      iconData: FontAwesomeIcons.minus,
      onTap: () async {
        context.read<CounterBloc>().add(const CounterDown());
      },
    );
  }
}

class CounterResetBox extends StatelessWidget {
  const CounterResetBox({super.key});

  @override
  Widget build(BuildContext context) {
    return NariButton(
      width: 100,
      backgroundColor: Colors.white,
      padding: EdgeInsets.zero,
      iconData: FontAwesomeIcons.arrowRotateLeft,
      onTap: () async {
        context.read<CounterBloc>().add(const CounterReset());
      },
    );
  }
}

Future<void> soundPlayer(BuildContext context) async {
  final volume = context.read<SettingBloc>().state.soundVolume;
  final isTurnOn = context.read<SettingBloc>().state.isSoundTurnOn;
  if (isTurnOn) {
    if (volume == 0) {
      //do nothing
    } else {
      final player = AudioPlayer();
      await player.setVolume(volume);
      await player.setAsset("assets/sound/click_sound.mp3");
      await player.play();
    }
  }
}
