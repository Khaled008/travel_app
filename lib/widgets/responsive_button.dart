import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  final VoidCallback? onTap;

  ResponsiveButton(
      {super.key, this.isResponsive = false, this.width = 120, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: isResponsive == true ? double.maxFinite : width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor,
          ),
          child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: AppText(
                        text: 'Booking Now',
                        color: Colors.white,
                        size: 22,
                      ),
                    )
                  : Container(),
              Image.asset('assets/images/button-one.png')
            ],
          ),
        ),
      ),
    );
  }
}
