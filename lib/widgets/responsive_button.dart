// lib/widgets/responsive_button.dart

import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  VoidCallback? onTap;

  ResponsiveButton({
    super.key,
    this.width = 120,
    this.isResponsive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: isResponsive == true ? double.maxFinite : width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.mainColor,
          ),
          child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.center
                : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: AppText(
                          text: "Booking Now", color: Colors.white, size: 20),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
