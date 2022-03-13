import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_assignment/common/constants/assets.dart';
import 'package:mobile_assignment/common/extensions/int.dart';
import 'package:mobile_assignment/common/helpers/file.dart';
import 'package:mobile_assignment/core/home/models/vehicle.dart';

abstract class HomeService {
  Future<Either<Error, List<VehicleModel>>> getVehicles();
}

class HomeServiceImpl implements HomeService {
  @override
  Future<Either<Error, List<VehicleModel>>> getVehicles() async {
    await 2.wait();

    try {
      final List data = await FileHelpers.readJsonAsset(
        Assets.vehicleDataset,
        useIsolate: true,
      );

      final vehicles = data.map((e) => VehicleModel.fromJson(e)).toList();

      return Right(vehicles);
    } catch (e, stackTrace) {
      debugPrint(stackTrace.toString());

      return Left(Error());
    }
  }
}
