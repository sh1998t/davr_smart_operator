import 'dart:io';

import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: ApkColor.dropDownColor,
            side: BorderSide.none,
            minimumSize: Size(297.w, 45.h),
             padding: EdgeInsets.symmetric(horizontal: 8.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onPressed: () => _pickImage(ImageSource.camera),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Включи камеру",
                style: TextStyle(

                    color: ApkColor.black, fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              SvgPicture.asset('assets/images/camera.svg'),
            ],
          ),
        ),
         SizedBox(height: 8.h,),
        if (_selectedImage != null)
          DottedBorder(
            color: Colors.blueAccent,
            strokeWidth: 2.w,
            dashPattern: [8, 5], // 6px chiziq, 4px bo‘shliq
            borderType: BorderType.RRect,
            radius: Radius.circular(12.r),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              padding: EdgeInsets.all(8.r),
              width: double.infinity,
              height: 106.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            ),
          )

        else

          DottedBorder(
            color: Colors.blue.shade200,
            strokeWidth: 2.w,
            borderType: BorderType.RRect,
            radius: Radius.circular(12.r),
            dashPattern: [6, 4],
            child: Container(
              width: double.infinity,
              height: 106.h,
              margin: EdgeInsets.symmetric(vertical: 8.h),
              alignment: Alignment.center,
              child: Text(
                "Rasm tanlanmagan",
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
            ),
          )

      ],
    );
  }
}
