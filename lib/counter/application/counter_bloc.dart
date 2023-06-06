import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterUp>(_onCounterUp);
    on<CounterDown>(_onCounterDown);
  }

  void _onCounterUp(CounterUp event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.count + 1));
  }

  void _onCounterDown(CounterDown event, Emitter<CounterState> emit) {
    int count = state.count;
    count = count - 1;
    if (count < 0) {
      emit(state.copyWith(count: 0));
    } else {
      emit(state.copyWith(count: count));
    }
  }
}
