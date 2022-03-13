import 'package:engineering_exercise/common/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/back_button.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  static const _height = 64.0;

  @override
  Widget build(BuildContext context) {
    final appBarTheme = context.theme.appBar;

    final parentRoute = ModalRoute.of(context);
    final useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    final leading =
        useCloseButton ? const CloseButton() : const AppBarBackButton();

    final appBarChild = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 64,
      child: NavigationToolbar(
        leading: leading,
        centerMiddle: true,
        middle: Text(
          title,
          style: TextStyle(
            color: appBarTheme.titleColor,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: appBarTheme.systemUiOverlayStyle,
      child: Container(
        color: appBarTheme.backgroundColor,
        child: SafeArea(
          bottom: false,
          child: appBarChild,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_height);
}
