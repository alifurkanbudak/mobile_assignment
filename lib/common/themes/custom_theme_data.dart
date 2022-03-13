import 'package:engineering_exercise/common/extensions/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomThemeData {
  CustomThemeData({
    required this.textField,
    required this.appBar,
    required this.bottomBar,
    required this.buttonColor,
    required this.labelColor,
    required this.logoColor,
    required this.shimmer,
    required this.snackBar,
    required this.scaffold,
  }) : themeData = ThemeData(
          scaffoldBackgroundColor: scaffold.bgColor,
          highlightColor: Colors.transparent,
          fontFamily: 'Raleway',
        );

  final CustomScaffoldTheme scaffold;
  final CustomTextFieldTheme textField;
  final CustomAppBarTheme appBar;
  final CustomBottomBarTheme bottomBar;
  final CustomShimmerTheme shimmer;
  final CustomSnackBarTheme snackBar;

  final Color buttonColor;
  final Color labelColor;
  final Color logoColor;

  final ThemeData themeData;
}

class CustomTextFieldTheme {
  const CustomTextFieldTheme({
    required this.backgroundColor,
    required this.hintColor,
    required this.textColor,
  });

  final Color backgroundColor;
  final Color hintColor;
  final Color textColor;
}

class CustomScaffoldTheme {
  CustomScaffoldTheme({
    required this.bgColor,
  }) : brightness = bgColor.brightness;

  final Color bgColor;
  final Brightness brightness;
}

class CustomAppBarTheme {
  CustomAppBarTheme({
    required this.backgroundColor,
    required this.titleColor,
    required this.iconColor,
  }) : systemUiOverlayStyle = backgroundColor.overlayStyle;

  final Color backgroundColor;
  final Color titleColor;
  final Color iconColor;
  final SystemUiOverlayStyle systemUiOverlayStyle;
}

class CustomBottomBarTheme {
  const CustomBottomBarTheme({
    required this.bgColor,
    required this.iconColor,
    required this.badgeColor,
  });

  final Color bgColor;
  final Color iconColor;
  final Color badgeColor;
}

class CustomShimmerTheme {
  const CustomShimmerTheme({
    required this.baseColor,
    required this.highlightColor,
  });

  final Color baseColor;
  final Color highlightColor;
}

class CustomSnackBarTheme {
  const CustomSnackBarTheme({
    required this.errorBgColor,
    required this.errorFrontColor,
  });

  final Color errorBgColor;
  final Color errorFrontColor;
}
