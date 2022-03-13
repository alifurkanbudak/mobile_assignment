import 'package:engineering_exercise/common/constants/assets.dart';
import 'package:flutter/material.dart';

class HomeRodoLogo extends StatelessWidget {
  const HomeRodoLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.homeLogo,
      height: 50,
    );
  }
}
