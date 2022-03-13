import 'package:engineering_exercise/common/extensions/context.dart';
import 'package:engineering_exercise/core/home/page.dart';
import 'package:engineering_exercise/core/tab_layout/models/tab_item.dart';
import 'package:engineering_exercise/core/tab_layout/widgets/badge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabLayoutPage extends StatefulWidget {
  const TabLayoutPage({Key? key}) : super(key: key);

  @override
  State<TabLayoutPage> createState() => _TabLayoutPageState();
}

class _TabLayoutPageState extends State<TabLayoutPage> {
  int _selectedInd = 0;

  final _tabItems = [
    TabItemModel(
      selectedIcon: Icons.home_rounded,
      unselectedIcon: Icons.home_outlined,
      page: const HomePage(),
    ),
    TabItemModel(
      selectedIcon: Icons.chat_bubble_rounded,
      unselectedIcon: Icons.chat_bubble_outline_rounded,
      page: const SizedBox(),
    ),
    TabItemModel(
      selectedIcon: Icons.favorite_rounded,
      unselectedIcon: Icons.favorite_border_rounded,
      page: const SizedBox(),
    ),
    TabItemModel(
      selectedIcon: Icons.upload_file_rounded,
      unselectedIcon: Icons.upload_file_outlined,
      page: const SizedBox(),
    ),
    TabItemModel(
      selectedIcon: Icons.settings_rounded,
      unselectedIcon: Icons.settings_outlined,
      page: const SizedBox(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomBarTheme = context.theme.bottomBar;

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: bottomBarTheme.bgColor,
        activeColor: bottomBarTheme.iconColor,
        inactiveColor: bottomBarTheme.iconColor,
        iconSize: 35,
        onTap: _onTap,
        items: List<BottomNavigationBarItem>.generate(
          5,
          _itemBuilder,
        ),
      ),
      tabBuilder: _tabBuilder,
    );
  }

  void _onTap(int ind) {
    setState(() {
      _selectedInd = ind;
    });
  }

  Widget _tabBuilder(_, int ind) {
    return CupertinoTabView(
      builder: (_) => _tabItems[ind].page,
    );
  }

  BottomNavigationBarItem _itemBuilder(int ind) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.topLeft,
        children: [
          Icon(
            _selectedInd == ind
                ? _tabItems[ind].selectedIcon
                : _tabItems[ind].unselectedIcon,
          ),
          if (_hasBadge(ind)) const TabItemBadge()
        ],
      ),
    );
  }

  // Normally this would read data from logic layer classes eg. Cubits
  bool _hasBadge(int ind) {
    return ind == 2 || ind == 3;
  }
}
