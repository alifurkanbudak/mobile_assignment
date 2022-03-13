import 'package:engineering_exercise/core/vehicle_type_selection/logic/cubit.dart';
import 'package:engineering_exercise/core/vehicle_type_selection/models/vehicle_type.dart';
import 'package:engineering_exercise/core/vehicle_type_selection/widgets/item_grid.dart';
import 'package:engineering_exercise/core/vehicle_type_selection/widgets/vehicle_type_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleTypeSelectionBody extends StatelessWidget {
  const VehicleTypeSelectionBody({
    Key? key,
    required this.vehicleTypes,
  }) : super(key: key);

  final List<VehicleTypeModel> vehicleTypes;

  @override
  Widget build(BuildContext context) {
    return VehicleTypesGrid(
      itemCount: vehicleTypes.length,
      itemBuilder: _itemBuilder,
      onRefresh: context.read<VehicleTypeSelectionCubit>().refresh,
    );
  }

  Widget _itemBuilder(_, int ind) {
    final item = vehicleTypes[ind];

    return VehicleTypeItem(
      imageUrl: item.imageUrl,
      name: item.name,
    );
  }
}
