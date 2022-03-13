import 'dart:ui';

import 'package:flutter/services.dart';

extension ColorExt on Color {
  Brightness get brightness =>
      computeLuminance() < 0.5 ? Brightness.dark : Brightness.light;

  SystemUiOverlayStyle get overlayStyle {
    final isDark = brightness == Brightness.dark;

    return isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
  }
}
