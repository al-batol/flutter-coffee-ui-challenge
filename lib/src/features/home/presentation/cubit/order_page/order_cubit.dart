import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit()
      : super(
          const OrderStates(
            deliverOrPickUp: true,
            shouldAnimateButton: false,
            counter: 1,
          ),
        );

  void toggleAnimatedButton(bool shouldAnimate) {
    emit(state.copyWith(shouldAnimateButton: !shouldAnimate));
  }

  void toggleDeliverOrPickUp(bool shouldDeliver) {
    emit(state.copyWith(deliverOrPickUp: shouldDeliver));
  }

  void increase() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrease() {
    if (state.counter - 1 > 0) {
      emit(state.copyWith(counter: state.counter - 1));
    }
  }
}
