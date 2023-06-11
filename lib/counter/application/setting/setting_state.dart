part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final bool isLoading;
 

  const SettingState({
    required this.isLoading,
  });

  factory SettingState.initial() => const SettingState(
        isLoading: false,
      );

  @override
  List<Object?> get props => [
        isLoading,
      ];

  SettingState copyWith({
    bool? isLoading,
  }) {
    return SettingState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
