import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailStates> {
  DetailCubit()
      : super(const DetailStates(
          coffeeSize: 1,
          isFavorite: false,
          shouldAnimateButton: false,
        ));

  void toggleFavorite(bool isFavorite) {
    emit(state.copyWith(isFavorite: isFavorite));
  }

  void changeCoffeeSize(int coffeeSize) {
    emit(state.copyWith(coffeeSize: coffeeSize));
  }

  void toggleAnimatedButton(bool shouldAnimate) {
    emit(state.copyWith(shouldAnimateButton: !shouldAnimate));
  }
}
