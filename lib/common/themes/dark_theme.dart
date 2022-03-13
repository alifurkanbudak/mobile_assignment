import 'package:engineering_exercise/common/themes/colors.dart';

import 'custom_theme_data.dart';

final darkTheme = CustomThemeData(
  textField: _textField,
  appBar: _appBar,
  bottomBar: _bottomBar,
  buttonColor: AppColors.vibrantGreen,
  labelColor: AppColors.white,
  logoColor: AppColors.vibrantGreen,
  snackBar: _snackBar,
  shimmer: _shimmer,
  scaffold: _scaffold,
);

final _scaffold = CustomScaffoldTheme(
  bgColor: AppColors.darkGreen,
);

const _textField = CustomTextFieldTheme(
  backgroundColor: AppColors.white,
  hintColor: AppColors.lightGray,
  textColor: AppColors.darkGreen,
);

final _appBar = CustomAppBarTheme(
  backgroundColor: AppColors.white,
  titleColor: AppColors.darkGreen,
  iconColor: AppColors.darkGreen,
);

const _bottomBar = CustomBottomBarTheme(
  bgColor: AppColors.white,
  iconColor: AppColors.darkGreen,
  badgeColor: AppColors.vibrantGreen,
);

const _snackBar = CustomSnackBarTheme(
  errorBgColor: AppColors.errorRed,
  errorFrontColor: AppColors.white,
);

const _shimmer = CustomShimmerTheme(
  baseColor: AppColors.green1,
  highlightColor: AppColors.green2,
);
