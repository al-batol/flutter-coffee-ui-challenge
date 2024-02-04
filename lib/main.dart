import 'package:coffee_shop_ui_challenge/src/core/helper/app_router.dart';
import 'package:coffee_shop_ui_challenge/src/core/services/injection_container.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/base_page/base_page_cubit.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<BasePageCubit>()..loadData()),
        BlocProvider(create: (context) => sl<HomeCubit>()),
      ],
      child: MaterialApp(
        title: 'Coffee Shop UI Challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => AppRouter.generateRoutes(settings),
      ),
    );
  }
}
