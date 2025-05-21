
import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    this.prefix,
    this.inputFormatters,
    this.hintText,
    this.style,
    this.width,
    this.height,
    this.keyboardType,
    this.textAlign,
    this.maxLength,
    this.controller,
    this.onchange,
    this.contentPadding,
    this.validator,
    this.title,
    this.textCapitalization,
    this.obscureText = false,
    this.suffix,
  });

  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final TextStyle? style;
  final double? width;
  final double? height;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final int? maxLength;
  final TextEditingController? controller;
  final ValueChanged? onchange;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final String? title;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title?.isNotEmpty ?? false,
          child: Text(
            "$title" ?? '',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: ApkColor.black,
            ),
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          controller: controller,
          textAlign: textAlign ?? TextAlign.start,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          onChanged: onchange,
          validator: validator,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ApkColor.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: ApkColor.black,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            prefix: const SizedBox(),
            prefixIcon: prefix,
            suffixIcon: suffix,
            fillColor: ApkColor.dropDownColor,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 15.sp,
              color: ApkColor.titleColor,
              fontWeight: FontWeight.w400,
            ),

            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
