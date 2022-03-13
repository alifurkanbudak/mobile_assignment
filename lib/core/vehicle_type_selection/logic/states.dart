import 'package:mobile_assignment/core/vehicle_type_selection/models/vehicle_type.dart';

class VehicleTypeSelectionState {}

class VehicleTypeSelectionDataState extends VehicleTypeSelectionState {
  VehicleTypeSelectionDataState({
    required this.vehicleTypes,
  });

  final List<VehicleTypeModel> vehicleTypes;
}

class VehicleTypeSelectionLoadingErrorState extends VehicleTypeSelectionState {
  VehicleTypeSelectionLoadingErrorState({
    required this.error,
  });

  final Error error;
}

class VehicleTypeSelectionRefreshErrorState extends VehicleTypeSelectionState {
  VehicleTypeSelectionRefreshErrorState({
    required this.vehicleTypes,
    required this.error,
  });

  final List<VehicleTypeModel> vehicleTypes;
  final Error error;

  VehicleTypeSelectionRefreshErrorState copyWith({
    List<VehicleTypeModel>? vehicleTypes,
    Error? error,
  }) =>
      VehicleTypeSelectionRefreshErrorState(
        vehicleTypes: vehicleTypes ?? this.vehicleTypes,
        error: error ?? this.error,
      );
}
