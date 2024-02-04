part of 'detail_cubit.dart';

class DetailStates extends Equatable {
  final int coffeeSize;
  final bool isFavorite;
  final bool shouldAnimateButton;

  const DetailStates({
    required this.coffeeSize,
    required this.isFavorite,
    required this.shouldAnimateButton,
  });

  DetailStates copyWith({
    int? coffeeSize,
    bool? isFavorite,
    bool? shouldAnimateButton,
  }) {
    return DetailStates(
      coffeeSize: coffeeSize ?? this.coffeeSize,
      isFavorite: isFavorite ?? this.isFavorite,
      shouldAnimateButton: shouldAnimateButton ?? this.shouldAnimateButton,
    );
  }

  @override
  List<Object?> get props => [coffeeSize, isFavorite, shouldAnimateButton];
}
