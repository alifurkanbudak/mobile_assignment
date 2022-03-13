class VehicleSearchResult {
  VehicleSearchResult({
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
}
