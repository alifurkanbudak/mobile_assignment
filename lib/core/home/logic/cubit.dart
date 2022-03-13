import 'package:engineering_exercise/core/home/logic/service.dart';
import 'package:engineering_exercise/core/home/logic/states.dart';
import 'package:engineering_exercise/core/home/models/vehicle.dart';
import 'package:engineering_exercise/core/home/models/vehicle_search_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.service,
  }) : super(HomeState());

  final HomeService service;

  Future<void> searchVehicles({
    String? make,
    String? model,
    int? budget,
    int? year,
  }) async {
    final res = await service.getVehicles();

    res.either(
      (error) => emit(
        HomeErrorState(
          error: error,
        ),
      ),
      (vehicles) {
        final filteredVehicles = _filterVehicles(
          vehicles,
          make,
          model,
          budget,
          year,
        );

        filteredVehicles.sort(
          (v1, v2) => v1.price.compareTo(v2.price),
        );

        final searchRes = _getSearchResult(filteredVehicles);

        // ignore: avoid_print
        print(searchRes.toJson);
      },
    );
  }

  List<VehicleModel> _filterVehicles(
    List<VehicleModel> vehicles,
    String? make,
    String? model,
    int? budget,
    int? year,
  ) {
    // To avoid converting to lower case multiple times
    final lowerMake = make?.toLowerCase();
    final lowerModel = model?.toLowerCase();

    final res = vehicles.where(
      (v) {
        bool include = true;

        if (lowerMake?.isNotEmpty == true) {
          include &= v.make.toLowerCase().contains(lowerMake!);
        }

        if (lowerModel?.isNotEmpty == true) {
          include &= v.model.toLowerCase().contains(lowerModel!);
        }

        if (budget != null) {
          include &= v.price <= budget;
        }

        if (year != null) {
          include &= v.year == year;
        }

        return include;
      },
    );

    return res.toList();
  }

  Future<void> searchVehiclesByMakeOrModel(String query) async {
    final res = await service.getVehicles();

    res.either(
      (error) => emit(
        HomeErrorState(
          error: error,
        ),
      ),
      (vehicles) {
        final filteredVehicles = _filterVehiclesByMakeOrModel(
          vehicles,
          query,
        );

        filteredVehicles.sort(
          (v1, v2) => v1.price.compareTo(v2.price),
        );

        final searchRes = _getSearchResult(filteredVehicles);

        // ignore: avoid_print
        print(searchRes.toJson);
      },
    );
  }

  List<VehicleModel> _filterVehiclesByMakeOrModel(
    List<VehicleModel> vehicles,
    String query,
  ) {
    // To avoid converting to lower case multiple times
    final lowerQuery = query.toLowerCase();

    final res = vehicles.where(
      (v) {
        bool include = true;

        include &= v.make.toLowerCase().contains(lowerQuery);

        return include;
      },
    );

    return res.toList();
  }

  VehicleSearchResult _getSearchResult(List<VehicleModel> vehicles) {
    if (vehicles.isEmpty) {
      return VehicleSearchResult(
        highestPrice: 0,
        lowestPrice: 0,
        medianPrice: 0,
        numberOfVehicles: 0,
      );
    }

    return VehicleSearchResult(
      lowestPrice: vehicles[0].price,
      highestPrice: vehicles[vehicles.length - 1].price,
      medianPrice: _calcMedianPrice(vehicles),
      numberOfVehicles: vehicles.length,
    );
  }

  double _calcMedianPrice(List<VehicleModel> vehicles) {
    if (vehicles.length.isEven) {
      return (vehicles[vehicles.length ~/ 2].price +
              vehicles[vehicles.length ~/ 2 + 1].price) /
          2;
    } else {
      return vehicles[vehicles.length ~/ 2].price.toDouble();
    }
  }
}
