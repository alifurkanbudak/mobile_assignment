import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_assignment/common/extensions/context.dart';

class HomeOutlinedButton extends StatefulWidget {
  const HomeOutlinedButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final FutureOr<void> Function() onTap;
  final String text;

  @override
  State<HomeOutlinedButton> createState() => _HomeOutlinedButtonState();
}

class _HomeOutlinedButtonState extends State<HomeOutlinedButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final color = context.theme.buttonColor;
    final borderRadius = BorderRadius.circular(50);

    return InkWell(
      borderRadius: borderRadius,
      onTap: _isLoading ? null : _onTap,
      splashColor: color.withOpacity(0.2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: borderRadius,
          border: Border.all(
            color: color,
            width: 1.5,
          ),
        ),
        height: 46,
        alignment: Alignment.center,
        child: _isLoading
            ? SizedBox(
                height: 28,
                width: 28,
                child: CircularProgressIndicator(
                  color: color,
                  strokeWidth: 3,
                ),
              )
            : Text(
                widget.text,
                style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }

  Future<void> _onTap() async {
    setState(() => _isLoading = true);

    await widget.onTap();

    setState(() => _isLoading = false);
  }
}
