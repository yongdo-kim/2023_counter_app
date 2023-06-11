import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'setting_event.dart';
part 'setting_state.dart';

@injectable
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState.initial()) {
    on<SettingVibeToggle>(_onSettingVibeToggle);
  }
  Future<void> _onSettingVibeToggle(
      SettingEvent event, Emitter<SettingState> emit) async {}
}
