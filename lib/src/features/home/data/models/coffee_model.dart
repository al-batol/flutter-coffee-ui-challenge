import 'package:equatable/equatable.dart';

class CoffeeModel extends Equatable {
  final int id;
  final String coffeeName;
  final String coffeeType;
  final String coffeeRate;
  final String coffeeDescription;
  final Map<String, double> coffeePrice;
  final String coffeeImage;

  const CoffeeModel({
    required this.id,
    required this.coffeeName,
    required this.coffeeType,
    required this.coffeeRate,
    required this.coffeeDescription,
    required this.coffeePrice,
    required this.coffeeImage,
  });

  factory CoffeeModel.fromMap(Map<String, dynamic> map) {
    return CoffeeModel(
      id: map['coffeeId'],
      coffeeName: map['coffeeName']!,
      coffeeType: map['coffeeType']!,
      coffeeRate: map['coffeeRate']!,
      coffeeDescription: map['coffeeDescription']!,
      coffeePrice: map['coffeePrice'],
      coffeeImage: map['coffeeImage'],
    );
  }

  @override
  List<Object?> get props => [id];
}
