part of 'detail_cubit.dart';

class DetailStates extends Equatable {
  final int coffeeSize;
  final bool isFavorite;
  final bool shouldAnimateButton;
  final bool willNotReadMore;

  const DetailStates({
    required this.coffeeSize,
    required this.isFavorite,
    required this.shouldAnimateButton,
    required this.willNotReadMore,
  });

  DetailStates copyWith({
    int? coffeeSize,
    bool? isFavorite,
    bool? shouldAnimateButton,
    bool? willNotReadMore,
  }) {
    return DetailStates(
      coffeeSize: coffeeSize ?? this.coffeeSize,
      isFavorite: isFavorite ?? this.isFavorite,
      shouldAnimateButton: shouldAnimateButton ?? this.shouldAnimateButton,
      willNotReadMore: willNotReadMore ?? this.willNotReadMore,
    );
  }

  @override
  List<Object?> get props => [
        coffeeSize,
        isFavorite,
        shouldAnimateButton,
        willNotReadMore,
      ];
}
