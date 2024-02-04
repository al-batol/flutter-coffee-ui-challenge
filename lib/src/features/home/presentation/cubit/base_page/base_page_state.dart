part of 'base_page_cubit.dart';

enum DataStates {
  loading,
  loaded,
}

class BasePageState extends Equatable {
  final int currentPage;
  final List<CoffeeModel> coffees;
  final DataStates? dataState;

  const BasePageState({
    required this.currentPage,
    required this.coffees,
    this.dataState,
  });

  BasePageState copyWith({
    int? currentPage,
    List<CoffeeModel>? coffees,
    DataStates? dataState,
    bool? shouldAnimateButton,
  }) {
    return BasePageState(
      currentPage: currentPage ?? this.currentPage,
      coffees: coffees ?? this.coffees,
      dataState: dataState ?? this.dataState,
    );
  }

  @override
  List<Object?> get props => [currentPage, coffees, dataState];
}
