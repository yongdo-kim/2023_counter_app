import 'package:hive/hive.dart';

part 'setting.g.dart';

@HiveType(typeId: 2)
class Setting {
  @HiveField(0)
  bool isSoundTurnOn;
  @HiveField(1)
  double soundVolume;
  @HiveField(2)
  bool isVibratorTurnOn;

  Setting({
    required this.isSoundTurnOn,
    required this.soundVolume,
    required this.isVibratorTurnOn,
  });

  Setting copyWith(
      {bool? isSoundTurnOn, bool? isVibratorTurnOn, double? soundVolume}) {
    return Setting(
        isSoundTurnOn: isSoundTurnOn ?? this.isSoundTurnOn,
        soundVolume: soundVolume ?? this.soundVolume,
        isVibratorTurnOn: isVibratorTurnOn ?? this.isVibratorTurnOn);
  }
}
