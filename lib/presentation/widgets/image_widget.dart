import 'dart:io';

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

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        print(_selectedImage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DottedBorder(
          color: Colors.blueAccent,
          strokeWidth: 2.w,
          dashPattern: [8, 5],
          borderType: BorderType.RRect,
          radius: Radius.circular(12.r),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            padding: EdgeInsets.all(8.r),
            width: double.infinity,
            height: 106.h,
            child: InkWell(
              onTap: _pickImage,
              child: _selectedImage != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              )
                  : Center(
                child: SvgPicture.asset(
                  'assets/images/svg/camera.svg',
                  width: 40.r,
                  height: 40.r,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
