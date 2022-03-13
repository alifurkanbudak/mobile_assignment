import 'package:equatable/equatable.dart';

class VehicleSearchResult extends Equatable {
  const VehicleSearchResult({
    required this.lowestPrice,
    required this.highestPrice,
    required this.medianPrice,
    required this.numberOfVehicles,
  });

  final int lowestPrice;
  final int highestPrice;
  final double medianPrice;
  final int numberOfVehicles;

  Map<String, dynamic> get toJson => {
        'lowest_price': lowestPrice,
        'highest_price': highestPrice,
        'median_price': medianPrice,
        'number_of_vehicles': numberOfVehicles,
      };

  @override
  List<Object?> get props => [
        lowestPrice,
        highestPrice,
        medianPrice,
        numberOfVehicles,
      ];
}
