
import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class CardWidget extends StatefulWidget {
  final String? name;
  final String? date;
  final String? summa;
  final VoidCallback? onevent;
  const CardWidget(
      {super.key,
         this.date,
         this.name,
         this.summa,
         this.onevent});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),

      ),
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        onPressed: widget.onevent,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          side: BorderSide.none,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: ApkColor.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: 16.r,
                      height: 16.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  spacing: 0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      '${widget.name}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ApkColor.black,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      '${widget.date}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: ApkColor.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.summa}',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: ApkColor.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
