part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object> get props => [];
}

class CounterStarted extends CounterEvent {
  const CounterStarted();
}

class CounterUp extends CounterEvent {
  const CounterUp();
}

class CounterDown extends CounterEvent {
  const CounterDown();
}