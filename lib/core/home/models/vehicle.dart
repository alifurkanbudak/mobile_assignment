class VehicleModel {
  final String make;
  final String model;
  final int year;
  final int vehicleCount;
  final int price;

  const VehicleModel({
    required this.make,
    required this.model,
    required this.year,
    required this.vehicleCount,
    required this.price,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        make: json['make'],
        model: json['model'],
        price: json['price'],
        vehicleCount: json['vehicle_count'],
        year: json['year'],
      );
}
