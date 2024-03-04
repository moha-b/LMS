import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animations/button_animation.dart';
import '../utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  // size
  final double? width;
  final double? height;
  // text
  final String text;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  // shape
  final Color? color;
  final bool isBorder;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  // icon
  final bool haveIcon;
  final IconData? icon;
  final double? sizeBetweenIconAndText;
  final Color? iconColor;
  final double? iconSize;
  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.isBorder = false,
    this.fontSize,
    this.color,
    super.key,
    this.margin,
    this.textColor,
    this.fontWeight,
    this.borderColor,
    this.haveIcon = false,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.sizeBetweenIconAndText,
  });
  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height ?? 55.h,
        width: width ?? 100.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? AppColors.primary,
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            border: isBorder
                ? Border.all(color: borderColor ?? AppColors.primary)
                : null),
        child: haveIcon
            ? Text(
                text,
                style: TextStyle(
                    color: textColor ?? AppColors.primary,
                    fontSize: fontSize ?? 16.sp,
                    fontWeight: FontWeight.normal),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: iconColor ?? AppColors.white,
                    size: iconSize,
                  ),
                  SizedBox(width: sizeBetweenIconAndText ?? 5.w),
                  Text(
                    text,
                    style: TextStyle(
                        color: textColor ?? AppColors.primary,
                        fontSize: fontSize ?? 16.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
      ),
    );
  }
}
