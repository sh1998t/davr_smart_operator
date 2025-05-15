
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/apk_color.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final bool? isLoading;
  final VoidCallback? onLongPress;
  final TextStyle? titleStyle;

  const AppButton({
    super.key,
    required this.title,
    this.titleColor,
    this.backgroundColor,
    required this.onPressed,
    this.height,
    this.width,
    this.isLoading,
    this.onLongPress,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? double.infinity,
      child: ElevatedButton(

        onPressed: onPressed,
        onLongPress: onLongPress,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            backgroundColor: backgroundColor,elevation: 0),
        child:
        (isLoading ?? false)
            ? const CircularProgressIndicator.adaptive()
            : Text(
          title,
          style:
          titleStyle ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: titleColor ?? ApkColor.black,
                fontSize: 17.sp,
              ),
        ),
      ),
    );
  }
}
