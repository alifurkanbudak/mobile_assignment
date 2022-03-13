import 'package:engineering_exercise/common/extensions/context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: Icon(
        CupertinoIcons.left_chevron,
        color: context.theme.appBar.iconColor,
        size: 36,
      ),
    );
  }
}
