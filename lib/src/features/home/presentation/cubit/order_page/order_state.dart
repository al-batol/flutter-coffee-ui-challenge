part of 'order_cubit.dart';

class OrderStates extends Equatable {
  final bool deliverOrPickUp;
  final int counter;
  final bool shouldAnimateButton;

  const OrderStates({
    required this.deliverOrPickUp,
    required this.counter,
    required this.shouldAnimateButton,
  });

  OrderStates copyWith(
      {bool? deliverOrPickUp, int? counter, bool? shouldAnimateButton}) {
    return OrderStates(
      deliverOrPickUp: deliverOrPickUp ?? this.deliverOrPickUp,
      counter: counter ?? this.counter,
      shouldAnimateButton: shouldAnimateButton ?? this.shouldAnimateButton,
    );
  }

  @override
  List<Object> get props => [deliverOrPickUp, counter, shouldAnimateButton];
}
