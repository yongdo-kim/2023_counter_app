part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final bool isLoading;
  final int count;

  const CounterState({required this.isLoading, required this.count});

  factory CounterState.initial() => const CounterState(
        isLoading: false,
        count: 0,
      );

  @override
  List<Object?> get props => [isLoading, count];

  CounterState copyWith({bool? isLoading, int? count}) {
    return CounterState(
        isLoading: isLoading ?? this.isLoading, count: count ?? this.count);
  }
}
