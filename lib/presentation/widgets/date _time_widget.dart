import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/apk_color.dart';

class DateTimeToWidget extends StatefulWidget {

  const DateTimeToWidget({super.key,});

  @override
  State<DateTimeToWidget> createState() => _DateTimeToWidgetState();
}

class _DateTimeToWidgetState extends State<DateTimeToWidget> {
  DateTime? _dateTime = DateTime.now();
  bool timeSelect = false;
  void getDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme:  ColorScheme.light(
              primary: ApkColor.backgroundColor, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xff2964ff), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (value != null) {
        final endOfDay = DateTime(
          value.year,
          value.month,
          value.day,
          23,
          59,
          59,
        );

        setState(() {
          _dateTime = endOfDay;
          timeSelect = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 140.w,
      height: 45.h,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: ApkColor.white,
              side: BorderSide.none,
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: BorderSide.none
              )
          ),
          onPressed: (){}, child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('08.05.2025',style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF484D51)
          ),),
          SvgPicture.asset('assets/images/calendar.svg',width: 25.r, height: 25.r,fit: BoxFit.fill,)
        ],
      )),
    );
  }
}