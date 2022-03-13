import 'dart:convert';
import 'dart:io';

import 'package:either_dart/src/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_assignment/common/helpers/file.dart';
import 'package:mobile_assignment/core/home/logic/cubit.dart';
import 'package:mobile_assignment/core/home/logic/service.dart';
import 'package:mobile_assignment/core/home/logic/states.dart';
import 'package:mobile_assignment/core/home/models/vehicle.dart';
import 'package:mobile_assignment/core/home/models/vehicle_search_result.dart';

import 'constants/assets.dart';

void main() {
  test('Counter value should be incremented', () async {
    final service = MockHomeService();

    final cubit = HomeCubit(service: service);

    await cubit.searchVehicles(make: 'acur');

    _expectSearchResult(
      cubit.state,
      const VehicleSearchResult(
        lowestPrice: 39616,
        highestPrice: 39616,
        medianPrice: 39616,
        numberOfVehicles: 29,
      ),
    );

    await cubit.searchVehicles(model: 'Stelvio Quadrifoglio');
    _expectSearchResult(
      cubit.state,
      const VehicleSearchResult(
        lowestPrice: 5000,
        highestPrice: 10000,
        medianPrice: 7500,
        numberOfVehicles: 20,
      ),
    );

    await cubit.searchVehicles(year: 2022);

    _expectSearchResult(
      cubit.state,
      const VehicleSearchResult(
        lowestPrice: 7828,
        highestPrice: 7828,
        medianPrice: 7828,
        numberOfVehicles: 291,
      ),
    );

    await cubit.searchVehicles(budget: 4950);

    _expectSearchResult(
      cubit.state,
      const VehicleSearchResult(
        lowestPrice: 4765,
        highestPrice: 4765,
        medianPrice: 4765,
        numberOfVehicles: 276,
      ),
    );
  });
}

void _expectSearchResult(
  HomeState state,
  VehicleSearchResult expectedResult,
) {
  expect(state.runtimeType, HomeDataState);

  expect(
    (state as HomeDataState).searchResult,
    expectedResult,
  );
}

class MockHomeService implements HomeService {
  @override
  Future<Either<Error, List<VehicleModel>>> getVehicles() async {
    json.decode(await File(TestAssets.vehicleDataset).readAsString());
    final List data = await FileHelpers.readJsonFile(TestAssets.vehicleDataset);

    final vehicles = data.map((v) => VehicleModel.fromJson(v)).toList();

    return Right(vehicles);
  }
}
