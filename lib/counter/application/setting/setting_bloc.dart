import 'package:counter2023/counter/domain/setting.dart';
import 'package:counter2023/counter/hive/hive_domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'setting_event.dart';
part 'setting_state.dart';

@injectable
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState.initial()) {
    on<SettingInit>(_onSettingInit);
    on<SettingVibratorToggle>(_onSettingVibratorToggle);
    on<SettingSoundToggle>(_onSettingSoundToggle);
    on<SettingChangeSoundVolume>(_onSettingChangeSoundVolume);
  }

  Future<void> _onSettingInit(
      SettingInit event, Emitter<SettingState> emit) async {
    final settingBox = await HiveDomain.getSettingBox;
    final result = settingBox.get("setting");

    emit(state.copyWith(
        isSoundTurnOn: result?.isSoundTurnOn ?? false,
        soundVolume: result?.soundVolume ?? 0,
        isVibratorTurnOn: result?.isVibratorTurnOn ?? false));
  }

  //소리 토글 및 사운드 지정

  Future<void> _onSettingSoundToggle(
      SettingSoundToggle event, Emitter<SettingState> emit) async {
    final settingBox = await HiveDomain.getSettingBox;
    //TIP : settingBox에서 setting이라는 키가 생겨서 시작될뿐임 더 많이 만들어질 수 있음
    settingBox.put(
        "setting",
        Setting(
            isSoundTurnOn: !state.isSoundTurnOn,
            soundVolume: state.soundVolume,
            isVibratorTurnOn: state.isVibratorTurnOn));
    emit(state.copyWith(isSoundTurnOn: !state.isSoundTurnOn));
  }

  Future<void> _onSettingChangeSoundVolume(
      SettingChangeSoundVolume event, Emitter<SettingState> emit) async {
    final settingBox = await HiveDomain.getSettingBox;
    settingBox.put(
        "setting",
        Setting(
            isSoundTurnOn: state.isSoundTurnOn,
            soundVolume: event.volume,
            isVibratorTurnOn: state.isVibratorTurnOn));
    emit(state.copyWith(soundVolume: event.volume));
  }

  //진동 지정
  Future<void> _onSettingVibratorToggle(
      SettingVibratorToggle event, Emitter<SettingState> emit) async {
    final settingBox = await HiveDomain.getSettingBox;
    settingBox.put(
        "setting",
        Setting(
            isSoundTurnOn: state.isSoundTurnOn,
            soundVolume: state.soundVolume,
            isVibratorTurnOn: !state.isVibratorTurnOn));
    emit(state.copyWith(isVibratorTurnOn: !state.isVibratorTurnOn));
  }
}
