import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputWidget extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Color? bgColor;
  final int? maxLength;

  const InputWidget({
    super.key,
    required this.labelText,
    required this.controller,
    required this.hintText,
    required this.inputType,
    this.inputFormatters,
    this.validator,

    this.bgColor,
    this.maxLength,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText,style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: ApkColor.titleColor
        ),),
        SizedBox(height: 5.h),
        Container(
          height: 45.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: ApkColor.dropDownColor,
            border: Border.all(color: Colors.grey.shade300),
          ),

          child: TextFormField(

            controller: widget.controller,
            textAlign: TextAlign.start,
            validator: widget.validator,

            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ApkColor.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
            keyboardType: widget.inputType,

            cursorColor: ApkColor.black,
            decoration: InputDecoration(

              hintText: widget.hintText,
              prefix: const SizedBox(),



              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 15.sp,
                color: ApkColor.textBlack,
                fontWeight: FontWeight.w400,
              ),

              filled: false,
              border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}