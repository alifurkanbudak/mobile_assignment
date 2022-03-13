import 'package:flutter/material.dart';
import 'package:mobile_assignment/common/constants/assets.dart';

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
