import 'package:engineering_exercise/common/constants/assets.dart';
import 'package:engineering_exercise/common/extensions/context.dart';
import 'package:engineering_exercise/core/vehicle_type_selection/widgets/item_grid.dart';
import 'package:engineering_exercise/core/vehicle_type_selection/widgets/vehicle_type_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VehicleTypesShimmer extends StatelessWidget {
  const VehicleTypesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VehicleTypesGrid(
      itemBuilder: _itemBuilder,
      itemCount: 12,
    );
  }

  Widget _itemBuilder(BuildContext context, __) => Shimmer.fromColors(
        child: const VehicleTypeItem(
          imageUrl: Assets.dummyCar,
          name: '#### ####',
        ),
        baseColor: context.theme.shimmer.baseColor,
        highlightColor: context.theme.shimmer.highlightColor,
      );
}
