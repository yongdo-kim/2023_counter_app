import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'setting_event.dart';
part 'setting_state.dart';

@injectable
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState.initial()) {
    on<SettingInit>(_onSettingInit);
    on<SettingVibeToggle>(_onSettingVibeToggle);
    on<SettingSoundToggle>(_onSettingSoundToggle);
    on<SettingChangeSoundVolume>(_onSettingChangeSoundVolume);
  }
  //TODO : 하이브로 초기값 가져오기
  Future<void> _onSettingInit(
      SettingInit event, Emitter<SettingState> emit) async {}

  //소리 토글 및 사운드 지정

  Future<void> _onSettingSoundToggle(
      SettingSoundToggle event, Emitter<SettingState> emit) async {
    emit(state.copyWith(isSoundTurnOn: !state.isSoundTurnOn));
  }

  Future<void> _onSettingChangeSoundVolume(
      SettingChangeSoundVolume event, Emitter<SettingState> emit) async {
    emit(state.copyWith(soundVolume: event.volume));
  }

  //진동 지정
  Future<void> _onSettingVibeToggle(
      SettingVibeToggle event, Emitter<SettingState> emit) async {}
}
