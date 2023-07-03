part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final bool isLoading;

  //TEST
  final List<CounterObject> counterObjects;
  final int currentIndex;

  const CounterState({
    required this.isLoading,
    required this.counterObjects,
    required this.currentIndex,
  });

  factory CounterState.initial() => CounterState(
      isLoading: false,
      counterObjects: [
        CounterObject(id: 0, count: 0, title: ""),
        CounterObject(id: 1, count: 0, title: ""),
        CounterObject(id: 2, count: 0, title: ""),
        CounterObject(id: 3, count: 0, title: ""),
        CounterObject(id: 4, count: 0, title: ""),
      ],
      currentIndex: 0);

  @override
  List<Object?> get props => [isLoading, counterObjects, currentIndex];

  CounterState copyWith(
      {bool? isLoading,
      int? count,
      List<CounterObject>? counterObjects,
      int? currentIndex}) {
    return CounterState(
        isLoading: isLoading ?? this.isLoading,
        counterObjects: counterObjects ?? this.counterObjects,
        currentIndex: currentIndex ?? this.currentIndex);
  }
}

class CounterObject {
  final int id;
  final int count;
  final String title;

  CounterObject({required this.id, required this.title, required this.count});

  CounterObject copyWith({
    int? id,
    int? count,
    String? title,
  }) {
    return CounterObject(
        id: id ?? this.id,
        title: title ?? this.title,
        count: count ?? this.count);
  }
}
