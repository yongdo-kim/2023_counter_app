import 'package:bloc/bloc.dart';
import 'package:counter2023/counter/domain/counter.dart';
import 'package:counter2023/counter/hive/hive_domain.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterStarted>(_onCounterStarted);
    on<CounterUp>(_onCounterUp);
    on<CounterDown>(_onCounterDown);
    on<CounterReset>(_onCounterReset);
  }

  Future<void> _onCounterStarted(
      CounterStarted event, Emitter<CounterState> emit) async {
    final countBox = await HiveDomain.getCountBox;
    final numberField = countBox.get('number');
    emit(state.copyWith(count: numberField?.number ?? 0));
  }

  Future<void> _onCounterUp(CounterUp event, Emitter<CounterState> emit) async {
    _onCounterSave(count: state.count + 1);
    emit(state.copyWith(count: state.count + 1));
  }

  Future<void> _onCounterDown(
      CounterDown event, Emitter<CounterState> emit) async {
    int count = state.count;
    count = count - 1;
    if (count < 0) {
      _onCounterSave(count: 0);
      emit(state.copyWith(count: 0));
    } else {
      _onCounterSave(count: count);
      emit(state.copyWith(count: count));
    }
  }

  Future<void> _onCounterReset(
      CounterReset event, Emitter<CounterState> emit) async {
    _onCounterSave(count: 0);
    emit(state.copyWith(count: 0));
  }

  //내부이벤트
  Future<void> _onCounterSave({required int count}) async {
    final countBox = await HiveDomain.getCountBox;
    await countBox.put('number', Count(number: count));
  }
}
