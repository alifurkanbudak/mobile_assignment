import 'package:engineering_exercise/common/extensions/context.dart';
import 'package:engineering_exercise/common/widgets/refresher/refresher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class VehicleTypesGrid extends StatelessWidget {
  const VehicleTypesGrid({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.onRefresh,
  }) : super(key: key);

  final Widget Function(BuildContext, int) itemBuilder;
  final Future<void> Function()? onRefresh;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    const horizSpacing = 56.0;
    const horizPadding = 50.0;

    final itemWidth = (context.width - horizSpacing - horizPadding * 2) / 2;

    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: horizSpacing,
      childAspectRatio: itemWidth / VehicleTypeSelectionConstants.itemHeight,
    );

    const padding = EdgeInsets.only(
      left: horizPadding,
      right: horizPadding,
      top: 27,
    );

    if (onRefresh == null) {
      return GridView.builder(
        gridDelegate: gridDelegate,
        padding: padding,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      );
    } else {
      return Refresher(
        onRefresh: onRefresh!,
        child: SliverPadding(
          padding: padding,
          sliver: SliverGrid(
            gridDelegate: gridDelegate,
            delegate: SliverChildBuilderDelegate(
              itemBuilder,
              childCount: itemCount,
            ),
          ),
        ),
      );
    }
  }
}
