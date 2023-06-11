part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();
  @override
  List<Object> get props => [];
}

//진동 on off
class SettingVibeToggle extends SettingEvent {
  const SettingVibeToggle();
}

//처음 시작할 카운터 셋팅
class SettingInitCounter extends SettingEvent {
  const SettingInitCounter();
}

//한번 클릭마다 up할 카운트
class SettingUpValue extends SettingEvent {
  const SettingUpValue();
}

//한번 클릭마다 down할 카운트
class SettingDownValue extends SettingEvent {
  const SettingDownValue();
}
