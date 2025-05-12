import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    required this.textSize,
    required this.iconSize,
    required this.icon,
    required this.iconLabel,
    super.key,
  });
  final IconData icon;
  final String iconLabel;
  final double textSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: iconSize),
        Text(iconLabel, style: TextStyle(fontSize: textSize, color: Colors.white)),
      ],
    );
  }
}
