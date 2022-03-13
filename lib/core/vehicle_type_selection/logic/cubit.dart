import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment/core/vehicle_type_selection/logic/states.dart';

import 'service.dart';

class VehicleTypeSelectionCubit extends Cubit<VehicleTypeSelectionState> {
  VehicleTypeSelectionCubit({
    required this.service,
  }) : super(VehicleTypeSelectionState());

  VehicleTypeSelectionService service;

  Future<void> fetchVehicleTypes() async {
    final res = await service.fetchVehicleTypes();

    res.either(
      (left) => emit(
        VehicleTypeSelectionLoadingErrorState(
          error: left,
        ),
      ),
      (right) => emit(
        VehicleTypeSelectionDataState(
          vehicleTypes: right,
        ),
      ),
    );
  }

  Future<void> refresh() async {
    final res = await service.fetchVehicleTypes();

    res.either(
      (left) => emit(
        VehicleTypeSelectionRefreshErrorState(
          vehicleTypes: state is VehicleTypeSelectionDataState
              ? (state as VehicleTypeSelectionDataState).vehicleTypes
              : [],
          error: left,
        ),
      ),
      (right) => emit(
        VehicleTypeSelectionDataState(
          vehicleTypes: right,
        ),
      ),
    );
  }
}
