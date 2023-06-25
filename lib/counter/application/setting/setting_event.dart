part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();
  @override
  List<Object> get props => [];
}

//처음 시작할 카운터 셋팅
class SettingInit extends SettingEvent {
  const SettingInit();
}

//한번 클릭마다 up할 카운트
class SettingUpValue extends SettingEvent {
  const SettingUpValue();
}

//한번 클릭마다 down할 카운트
class SettingDownValue extends SettingEvent {
  const SettingDownValue();
}

//소리 On Off setting
class SettingSoundToggle extends SettingEvent {
  const SettingSoundToggle();
}

class SettingChangeSoundVolume extends SettingEvent {
  final double volume;
  const SettingChangeSoundVolume({required this.volume});
}

//진동 on off
class SettingVibratorToggle extends SettingEvent {
  const SettingVibratorToggle();
}

class SettingChangeVibratorVolume extends SettingEvent {
  final int volume;
  const SettingChangeVibratorVolume({required this.volume});
}
