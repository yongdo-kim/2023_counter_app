import 'package:bloc/bloc.dart';
import 'package:counter2023/counter/domain/counterobj.dart';
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
    final countBox = await HiveDomain.getCountObjBox;
    final List<CounterObject> saveList = state.counterObjects;
    countBox.keys.map((key) {
      final value = countBox.get(key);
      saveList[key] = CounterObject(
          id: value?.id ?? -1,
          title: value?.title ?? "",
          count: value?.count ?? 0);
    }).toList();
    emit(state.copyWith(counterObjects: saveList));
  }

  Future<void> _onCounterUp(CounterUp event, Emitter<CounterState> emit) async {
    final newObjs = state.counterObjects.map((obj) {
      if (obj.id == event.index) {
        int count = obj.count + 1;
        return obj.copyWith(count: count);
      } else {
        return obj;
      }
    }).toList();

    _onCounterSave(index: event.index, objs: newObjs);

    emit(state.copyWith(counterObjects: newObjs));
  }

  Future<void> _onCounterDown(
      CounterDown event, Emitter<CounterState> emit) async {
    final newObjs = state.counterObjects.map((obj) {
      if (obj.id == event.index) {
        int count = obj.count - 1;
        if (count < 0) count = 0;
        return obj.copyWith(count: count);
      } else {
        return obj;
      }
    }).toList();

    _onCounterSave(index: event.index, objs: newObjs);
    emit(state.copyWith(counterObjects: newObjs));
  }

  Future<void> _onCounterReset(
      CounterReset event, Emitter<CounterState> emit) async {
    final newObjs = state.counterObjects.map((obj) {
      if (obj.id == event.index) {
        return obj.copyWith(count: 0);
      } else {
        return obj;
      }
    }).toList();
    _onCounterSave(index: event.index, objs: newObjs);
    emit(state.copyWith(counterObjects: newObjs));
  }

  Future<void> _onCounterIndexChanged(
      CounterIndexChanged event, Emitter<CounterState> emit) async {
    emit(state.copyWith(currentIndex: event.index));
  }

  //내부이벤트
  //
  Future<void> _onCounterSave(
      {required int index, required List<CounterObject> objs}) async {
    final countBox = await HiveDomain.getCountObjBox;
    final targetObj = objs[index];
    countBox.put(
        index,
        CounterObjectHive(
            id: targetObj.id, count: targetObj.count, title: targetObj.title));
  }
}
