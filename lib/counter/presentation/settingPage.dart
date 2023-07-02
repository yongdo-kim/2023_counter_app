import 'package:counter2023/counter/application/setting/setting_bloc.dart';
import 'package:counter2023/design/appbar/nari_app_bar.dart';
import 'package:counter2023/design/card/nari_card.dart';
import 'package:counter2023/design/color/nari_color.dart';
import 'package:counter2023/design/font/nari_font.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NariAppBar(
        title: tr('setting'),
        actions: const [],
      ),
      body: SafeArea(child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),

                ///////////////사운드///////////////
                FaIcon(
                  FontAwesomeIcons.volumeHigh,
                  color: state.isSoundTurnOn
                      ? NariColor.primaryColor
                      : NariColor.secondaryGrey,
                  size: 24,
                ),
                const SizedBox(
                  height: 24,
                ),
                const SoundToggle(),
                const SizedBox(
                  height: 24,
                ),
                const SoundVolume(),
                ///////////////진동///////////////
                const SizedBox(
                  height: 36,
                ),
                FaIcon(
                  FontAwesomeIcons.drum,
                  color: state.isVibratorTurnOn
                      ? NariColor.primaryColor
                      : NariColor.secondaryGrey,
                  size: 24,
                ),
                const SizedBox(
                  height: 16,
                ),
                const VibratorToggle(), //진동크기는 반응이 느림
                const SizedBox(
                  height: 24,
                ),
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
                Text(
                  "${tr('sound')} on/off",
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
                Text(
                  "${tr('loudness')} on/off",
                  style: NariFont.bold16,
                ),
                Slider(
                    min: 0,
                    max: 2,
                    value: state.soundVolume,
                    activeColor:
                        state.isSoundTurnOn ? null : NariColor.primaryGrey,
                    inactiveColor: NariColor.secondaryGrey,
                    onChanged: ((value) {
                      if (state.isSoundTurnOn) {
                        context
                            .read<SettingBloc>()
                            .add(SettingChangeSoundVolume(volume: value));
                      }
                    }))
              ],
            ),
          ),
        );
      },
    );
  }
}

class VibratorToggle extends StatelessWidget {
  const VibratorToggle({super.key});

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
                Text(
                  "${tr('vibration')} on/off",
                  style: NariFont.bold16,
                ),
                Switch(
                    value: state.isVibratorTurnOn,
                    onChanged: (value) {
                      context
                          .read<SettingBloc>()
                          .add(const SettingVibratorToggle());
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
