part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final bool isLoading;
  //소리
  final bool isSoundTurnOn;
  final double soundVolume;
  //진동
  final bool isVibratorTurnOn;
  final int vibratorVolume;

  const SettingState({
    required this.isLoading,
    required this.isSoundTurnOn,
    required this.soundVolume,
    required this.isVibratorTurnOn,
    required this.vibratorVolume,
  });

  factory SettingState.initial() => const SettingState(
      isLoading: false,
      isSoundTurnOn: true,
      soundVolume: 5,
      vibratorVolume: 100,
      isVibratorTurnOn: false);

  @override
  List<Object?> get props =>
      [isLoading, isSoundTurnOn, soundVolume, vibratorVolume, isVibratorTurnOn];

  SettingState copyWith(
      {bool? isLoading,
      bool? isSoundTurnOn,
      double? soundVolume,
      bool? isVibratorTurnOn,
      int? vibratorVolume}) {
    return SettingState(
        isLoading: isLoading ?? this.isLoading,
        isSoundTurnOn: isSoundTurnOn ?? this.isSoundTurnOn,
        soundVolume: soundVolume ?? this.soundVolume,
        isVibratorTurnOn: isVibratorTurnOn ?? this.isVibratorTurnOn,
        vibratorVolume: vibratorVolume ?? this.vibratorVolume);
  }
}
