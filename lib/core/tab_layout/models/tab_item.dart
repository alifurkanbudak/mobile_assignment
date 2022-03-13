import 'package:flutter/widgets.dart';

class TabItemModel {
  TabItemModel({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.page,
  });

  final IconData selectedIcon;
  final IconData unselectedIcon;
  final Widget page;
}
