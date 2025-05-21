import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownButtonCarWidget extends StatefulWidget {
  final List<Map<String, dynamic>> list;
  final ValueChanged? onChanged;
final String title;
  final Map<String , dynamic>? selectedCarId;
   DropDownButtonCarWidget({super.key,
    required this.list,
    required this.title,
    this.selectedCarId,
    this.onChanged,});

  @override
  State<DropDownButtonCarWidget> createState() => _DropDownButtonCarWidgetState();
}

class _DropDownButtonCarWidgetState extends State<DropDownButtonCarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: ApkColor.titleColor
        ),),
        SizedBox(height: 5.h,),
        Container(
          height: 40.sp,
          padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 0.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: ApkColor.dropDownColor,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Map<String, dynamic>>(
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 24.sp),
              value: widget.selectedCarId,
              borderRadius: BorderRadius.circular(12.r),
              dropdownColor: ApkColor.white,
              hint: Text(''),
              onChanged: widget.onChanged,
              items: widget.list.map((e) {

                return DropdownMenuItem<Map<String, dynamic>>(
                  value: e,
                  child: Text(
                    e['label'],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
