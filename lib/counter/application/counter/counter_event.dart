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
   final int index;
  const CounterUp({required this.index});
}

class CounterDown extends CounterEvent {
   final int index;
  const CounterDown({required this.index});
}

class CounterReset extends CounterEvent {
   final int index;
  const CounterReset({required this.index});
}

class CounterIndexChanged extends CounterEvent {
  final int index;
  const CounterIndexChanged({required this.index});
}
