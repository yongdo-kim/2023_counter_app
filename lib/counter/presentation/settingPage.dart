import 'package:counter2023/counter/application/setting/setting_bloc.dart';
import 'package:counter2023/design/appbar/nari_app_bar.dart';
import 'package:counter2023/design/card/nari_card.dart';
import 'package:counter2023/design/color/nari_color.dart';
import 'package:counter2023/design/font/nari_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: SafeArea(child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: const [
                SizedBox(
                  height: 24,
                ),

                //사운드
                SoundToggle(),
                SizedBox(
                  height: 24,
                ),

                SoundVolume()
                //숫자 초기화
              ],
            ),
          );
        },
      )),
    );
  }
}

class SoundToggle extends StatelessWidget {
  const SoundToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return NariCard(
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "버튼 소리",
                  style: NariFont.bold16,
                ),
                Switch(
                    value: state.isSoundTurnOn,
                    onChanged: (value) {
                      context
                          .read<SettingBloc>()
                          .add(const SettingSoundToggle());
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SoundVolume extends StatelessWidget {
  const SoundVolume({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return NariCard(
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "소리 크기",
                  style: NariFont.bold16,
                ),
                Slider(
                    min: 0,
                    max: 20,
                    value: state.soundVolume,
                    onChanged: ((value) => context
                        .read<SettingBloc>()
                        .add(SettingChangeSoundVolume(volume: value))))
              ],
            ),
          ),
        );
      },
    );
  }
}
