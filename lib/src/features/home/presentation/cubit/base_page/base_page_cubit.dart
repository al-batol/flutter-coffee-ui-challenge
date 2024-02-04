import 'package:bloc/bloc.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/data/models/coffee_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/data_sources/coffee_data.dart';

part 'base_page_state.dart';

class BasePageCubit extends Cubit<BasePageState> {
  BasePageCubit()
      : super(const BasePageState(
          currentPage: 0,
          coffees: [],
        ));

  void changePage(int pageIndex) {
    emit(state.copyWith(currentPage: pageIndex));
  }

  void loadData() {
    emit(state.copyWith(dataState: DataStates.loading));
    List<CoffeeModel> coffees = [];
    for (Map<String, dynamic> coffee in coffeesData) {
      coffees.add(CoffeeModel.fromMap(coffee));
    }
    emit(state.copyWith(coffees: coffees, dataState: DataStates.loaded));
  }
}
