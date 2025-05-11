import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:davr_smart_operator/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowButtonSheetWidget extends StatelessWidget {
  const ShowButtonSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.8,
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
            color: ApkColor.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Summa ',style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 20.sp,
            color: Colors.black
          ),),
          Text('800000 ',style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 20.sp,
              color: Colors.black
          ),),
          Text('Shavkat ',style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 20.sp,
              color: Colors.black
          ),),
          ButtonWidget(padding: EdgeInsets.symmetric(horizontal: 100.w,vertical: 8.h))
        ],
      ),
    );
  }
}
