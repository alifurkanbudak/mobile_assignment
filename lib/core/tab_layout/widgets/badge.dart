import 'package:flutter/material.dart';
import 'package:mobile_assignment/common/extensions/context.dart';

class TabItemBadge extends StatelessWidget {
  const TabItemBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomBarTheme = context.theme.bottomBar;

    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: bottomBarTheme.badgeColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: bottomBarTheme.bgColor,
        ),
      ),
    );
  }
}
