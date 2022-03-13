import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment/core/home/logic/service.dart';
import 'package:mobile_assignment/core/home/logic/states.dart';
import 'package:mobile_assignment/core/home/models/vehicle.dart';
import 'package:mobile_assignment/core/home/models/vehicle_search_result.dart';

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

        emit(
          HomeDataState(
            searchResult: searchRes,
          ),
        );
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

        emit(
          HomeDataState(
            searchResult: searchRes,
          ),
        );
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
      (v) =>
          v.make.toLowerCase().contains(lowerQuery) ||
          v.model.toLowerCase().contains(lowerQuery),
    );

    return res.toList();
  }

  VehicleSearchResult _getSearchResult(List<VehicleModel> vehicles) {
    if (vehicles.isEmpty) {
      return const VehicleSearchResult(
        highestPrice: 0,
        lowestPrice: 0,
        medianPrice: 0,
        numberOfVehicles: 0,
      );
    }

    final numberOfVehicles =
        vehicles.fold<int>(0, (prev, v) => prev += v.vehicleCount);

    return VehicleSearchResult(
      lowestPrice: vehicles[0].price,
      highestPrice: vehicles[vehicles.length - 1].price,
      medianPrice: _calcMedianPrice(vehicles, numberOfVehicles),
      numberOfVehicles: numberOfVehicles,
    );
  }

  double _calcMedianPrice(List<VehicleModel> vehicles, int numberOfVehicles) {
    final medianLen = numberOfVehicles ~/ 2;

    int currSum = 0;

    for (int i = 0; i < vehicles.length; i++) {
      currSum += vehicles[i].vehicleCount;

      if (currSum >= medianLen + 1) {
        return vehicles[i].price.toDouble();
      } else if (currSum == medianLen) {
        if (numberOfVehicles.isOdd) {
          return vehicles[i + 1].price.toDouble();
        } else {
          return (vehicles[i].price + vehicles[i + 1].price) / 2;
        }
      }
    }

    // Shouldn't reach here
    throw UnimplementedError();
  }
}
