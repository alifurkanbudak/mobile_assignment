import 'package:either_dart/either.dart';
import 'package:engineering_exercise/common/constants/assets.dart';
import 'package:engineering_exercise/common/extensions/int.dart';
import 'package:engineering_exercise/common/helpers/file.dart';
import 'package:engineering_exercise/core/home/models/vehicle.dart';
import 'package:flutter/foundation.dart';

class HomeService {
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
