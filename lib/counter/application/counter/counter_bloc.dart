import 'package:bloc/bloc.dart';
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
    on<CounterIndexChanged>(_onCounterIndexChanged);
  }

  Future<void> _onCounterStarted(
      CounterStarted event, Emitter<CounterState> emit) async {
    //TODO : 리스트로 변형 필요
    final countBox = await HiveDomain.getCountBox;
    final numberField = countBox.get('number');
    emit(state.copyWith(count: numberField?.number ?? 0));
  }

  Future<void> _onCounterUp(CounterUp event, Emitter<CounterState> emit) async {
    final newData = state.counterObjects.map((obj) {
      if (obj.id == event.index) {
        int count = obj.count + 1;
        return obj.copyWith(count: count);
      } else {
        return obj;
      }
    }).toList();
    print(newData);
    // _onCounterSave(, index: event.index);
    emit(state.copyWith(counterObjects: newData));
  }

  Future<void> _onCounterDown(
      CounterDown event, Emitter<CounterState> emit) async {
    int count = state.count;
    count = count - 1;
    if (count < 0) {
      _onCounterSave(index: event.index, count: 0);
      emit(state.copyWith(count: 0));
    } else {
      _onCounterSave(index: event.index, count: count);
      emit(state.copyWith(count: count));
    }
  }

  Future<void> _onCounterReset(
      CounterReset event, Emitter<CounterState> emit) async {
    _onCounterSave(index: event.index, count: 0);
    emit(state.copyWith(count: 0));
  }

  Future<void> _onCounterIndexChanged(
      CounterIndexChanged event, Emitter<CounterState> emit) async {
    emit(state.copyWith(currentIndex: event.index));
  }

  //내부이벤트
  Future<void> _onCounterSave({required int index, required int count}) async {
    // final countBox = await HiveDomain.getCountBox;
    // await countBox.put('number', Count(number: count));
  }
}
