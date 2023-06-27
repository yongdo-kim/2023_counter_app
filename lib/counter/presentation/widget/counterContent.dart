import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:counter2023/counter/application/counter/counter_bloc.dart';
import 'package:counter2023/counter/application/setting/setting_bloc.dart';
import 'package:counter2023/design/button/nari_button.dart';
import 'package:counter2023/design/color/nari_color.dart';
import 'package:counter2023/design/font/nari_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';

class CounterContent extends StatelessWidget {
  final int index;
  const CounterContent({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, settingState) {
        return BlocConsumer<CounterBloc, CounterState>(
          listenWhen: (previous, current) =>
              previous.counterObjects[previous.currentIndex] !=
              current.counterObjects[current.currentIndex],
          listener: (context, counterState) async {
            if (context.read<SettingBloc>().state.isSoundTurnOn) {
              await soundPlayer(context);
            }

            if (context.read<SettingBloc>().state.isVibratorTurnOn) {
              await vibratorPlayer(context);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                AnimatedFlipCounter(
                    duration: const Duration(milliseconds: 100),
                    value: state.counterObjects[state.currentIndex].count,
                    textStyle: NariFont.bold.copyWith(
                        fontSize: 120, color: NariColor.primaryBlack)),
                const Expanded(child: SizedBox()),
                NariButton(
                  width: 256,
                  height: 256,
                  iconData: FontAwesomeIcons.plus,
                  iconSize: 64,
                  backgroundColor: Colors.white,
                  onTap: () async {
                    context
                        .read<CounterBloc>()
                        .add(CounterUp(index: state.currentIndex));
                  },
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [CounterMinusBox(), CounterResetBox()],
                  ),
                ),
                const Expanded(child: SizedBox())
              ],
            );
          },
        );
      },
    );
  }
}

class CounterMinusBox extends StatelessWidget {
  const CounterMinusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return NariButton(
          width: 100,
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
          iconData: FontAwesomeIcons.minus,
          onTap: () async {
            context
                .read<CounterBloc>()
                .add(CounterDown(index: state.currentIndex));
          },
        );
      },
    );
  }
}

class CounterResetBox extends StatelessWidget {
  const CounterResetBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return NariButton(
          width: 100,
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
          iconData: FontAwesomeIcons.arrowRotateLeft,
          onTap: () async {
            context
                .read<CounterBloc>()
                .add(CounterReset(index: state.currentIndex));
          },
        );
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
      print("yongdo is here $volume");
      final player = AudioPlayer();
      await player.setAsset("assets/sound/click_sound.mp3");
      await player.setVolume(volume);
      await player.play();
    }
  }
}

Future<void> vibratorPlayer(BuildContext context) async {
  final volume = context.read<SettingBloc>().state.vibratorVolume;
  final isTurnOn = context.read<SettingBloc>().state.isVibratorTurnOn;

  if (isTurnOn) {
    if (volume == 0) {
      //do nothing
    } else {
      final hasVibrator = await Vibration.hasVibrator() ?? false;
      if (hasVibrator) {
        Vibration.vibrate();
      }
    }
  }
}
