import 'package:flutter/material.dart';
import 'package:mobile_assignment/common/extensions/context.dart';

class SnackBarHelper {
  static void showError(
    BuildContext context, {
    required String message,
  }) {
    final snackBarTheme = context.readTheme.snackBar;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: snackBarTheme.errorFrontColor,
          ),
        ),
        backgroundColor: snackBarTheme.errorBgColor,
      ),
    );
  }
}
