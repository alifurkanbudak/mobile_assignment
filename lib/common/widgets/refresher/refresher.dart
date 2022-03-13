import 'package:engineering_exercise/common/extensions/context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Refresher extends StatelessWidget {
  const Refresher({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: context.theme.scaffold.brightness,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
          ),
          child,
        ],
      ),
    );
  }
}
