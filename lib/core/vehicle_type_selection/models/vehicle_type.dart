class VehicleTypeModel {
  VehicleTypeModel({
    required this.imageUrl,
    required this.name,
  });

  final String imageUrl;
  final String name;

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) =>
      VehicleTypeModel(
        imageUrl: json['imageUrl'],
        name: json['name'],
      );
}
