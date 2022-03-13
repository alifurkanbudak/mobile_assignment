import 'package:flutter/material.dart';
import 'package:mobile_assignment/common/extensions/context.dart';

class VehicleTypeItem extends StatelessWidget {
  const VehicleTypeItem({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          height: 50,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 2),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: context.theme.labelColor,
          ),
        ),
      ],
    );
  }
}
