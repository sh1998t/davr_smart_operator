import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Size? size;
  final VoidCallback? onPressed;
  final String? text;
  final double? textSize;
  final Color? color;
  const ButtonWidget({super.key,
    required this.padding,
    this.size,
    this.onPressed,
    this.text,
    this.color,
    this.textSize});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(

        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          padding:padding,
              minimumSize: size
        ),
        onPressed: onPressed, child:Text("$text", style: TextStyle(
      fontSize: textSize,
      fontWeight: FontWeight.w500,
      color: ApkColor.black
    ),));
  }
}
