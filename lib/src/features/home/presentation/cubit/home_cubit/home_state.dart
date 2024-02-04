part of 'home_cubit.dart';

enum CurrentState {
  changingItem,
  itemChanged,
}

class HomeState extends Equatable {
  final CurrentState? currentState;
  final int? itemNumber;
  final bool shouldScale;
  final int indexItemToScale;

  const HomeState({
    required this.itemNumber,
    this.currentState,
    required this.shouldScale,
    required this.indexItemToScale,
  });

  HomeState copyWith(
      {int? itemNumber,
      CurrentState? currentState,
      bool? shouldScale,
      int? indexItemToScale}) {
    return HomeState(
      itemNumber: itemNumber ?? this.itemNumber,
      currentState: currentState ?? this.currentState,
      shouldScale: shouldScale ?? this.shouldScale,
      indexItemToScale: indexItemToScale ?? this.indexItemToScale,
    );
  }

  @override
  List<Object?> get props => [
        itemNumber,
        currentState,
        shouldScale,
        indexItemToScale,
      ];
}
