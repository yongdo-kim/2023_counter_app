part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final bool isLoading;
  final bool isSoundTurnOn;
  final double soundVolume;

  const SettingState({
    required this.isLoading,
    required this.isSoundTurnOn,
    required this.soundVolume,
  });

  factory SettingState.initial() =>
      const SettingState(isLoading: false, isSoundTurnOn: true, soundVolume: 5);

  @override
  List<Object?> get props => [isLoading, isSoundTurnOn, soundVolume];

  SettingState copyWith(
      {bool? isLoading, bool? isSoundTurnOn, double? soundVolume}) {
    return SettingState(
        isLoading: isLoading ?? this.isLoading,
        isSoundTurnOn: isSoundTurnOn ?? this.isSoundTurnOn,
        soundVolume: soundVolume ?? this.soundVolume);
  }
}
