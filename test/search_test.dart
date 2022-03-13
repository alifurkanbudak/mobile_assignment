import 'dart:convert';
import 'dart:io';

import 'package:either_dart/src/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_assignment/common/helpers/file.dart';
import 'package:mobile_assignment/core/home/logic/cubit.dart';
import 'package:mobile_assignment/core/home/logic/service.dart';
import 'package:mobile_assignment/core/home/logic/states.dart';
import 'package:mobile_assignment/core/home/models/vehicle.dart';

import 'constants/assets.dart';

void main() {
  test('Counter value should be incremented', () async {
    final service = MockHomeService();

    final cubit = HomeCubit(service: service);

    await cubit.searchVehicles(make: 'acur');

    expect(cubit.state.runtimeType, HomeDataState);
    expect(
      (cubit.state as HomeDataState).searchResult.medianPrice,
      39616,
    );

    await cubit.searchVehicles(model: 'cx');

    expect(cubit.state.runtimeType, HomeDataState);
    expect(
      (cubit.state as HomeDataState).searchResult.medianPrice,
      56854,
    );

    await cubit.searchVehicles(year: 2019);

    expect(cubit.state.runtimeType, HomeDataState);
    expect(
      (cubit.state as HomeDataState).searchResult.medianPrice,
      7828,
    );

    await cubit.searchVehicles(budget: 5000);

    expect(cubit.state.runtimeType, HomeDataState);
    expect(
      (cubit.state as HomeDataState).searchResult.medianPrice,
      4765,
    );
  });
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
