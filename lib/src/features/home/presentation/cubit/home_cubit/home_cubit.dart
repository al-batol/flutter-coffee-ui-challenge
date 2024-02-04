import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState(
          itemNumber: 0,
          shouldScale: false,
          indexItemToScale: 0,
        ));

  void setItemNumber(int itemNumber) {
    emit(state.copyWith(currentState: CurrentState.changingItem));
    emit(state.copyWith(itemNumber: itemNumber));
    emit(state.copyWith(currentState: CurrentState.itemChanged));
  }

  void toggleScale({int? index}) {
    emit(state.copyWith(
      shouldScale: !state.shouldScale,
      indexItemToScale: index,
    ));
  }
}
