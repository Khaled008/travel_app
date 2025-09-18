import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  String? text;
  IconData? icon;
  bool? isIcon;
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;

  AppButtons({
    super.key,
    this.text = 'hello',
    this.icon,
    this.isIcon = false,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
