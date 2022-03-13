import 'package:either_dart/either.dart';
import 'package:mobile_assignment/common/constants/assets.dart';
import 'package:mobile_assignment/common/extensions/int.dart';
import 'package:mobile_assignment/common/helpers/file.dart';
import 'package:mobile_assignment/core/vehicle_type_selection/models/vehicle_type.dart';

class VehicleTypeSelectionService {
  Future<Either<Error, List<VehicleTypeModel>>> fetchVehicleTypes() async {
    await 2.wait();

    try {
      final List data = await FileHelpers.readJsonAsset(Assets.vehicleTypes);

      final vehicleTypes =
          data.map((e) => VehicleTypeModel.fromJson(e)).toList();

      return Right(vehicleTypes);
    } catch (e) {
      return Left(Error());
    }
  }
}
