import 'package:coffee_shop_ui_challenge/src/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/pages/base_page.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/pages/detail_page.dart';
import 'package:coffee_shop_ui_challenge/src/features/home/presentation/pages/order_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter();

  static Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case BasePage.routeName:
        return MaterialPageRoute(builder: (context) => const BasePage());
      case DetailPage.routeName:
        final CoffeeModel coffeeModel = settings.arguments as CoffeeModel;
        return MaterialPageRoute(
          builder: (context) => DetailPage(coffee: coffeeModel),
        );
      case OrderPage.routeName:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => OrderPage(
            coffee: arguments['coffee'],
            coffeeSize: arguments['coffeeSize'],
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => const BasePage());
    }
  }
}
