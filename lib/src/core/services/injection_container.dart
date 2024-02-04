import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/base_page/base_page_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerFactory(() => BasePageCubit())
    ..registerLazySingleton(() => HomeCubit());
}
