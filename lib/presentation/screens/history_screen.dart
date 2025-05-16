import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/card_widget.dart';
import '../widgets/show_button_sheet_widget.dart';

List<Map<String, dynamic>> list =[

  {'name':'Shavkat','date':'12,03.1998','summa':'500', },
  {'name':'Shavkat','date':'12,03.1998','summa':'500', },
  {'name':'Shavkat','date':'12,03.1998','summa':'500', },
  {'name':'Shavkat','date':'12,03.1998','summa':'500', },
  {'name':'Shavkat','date':'12,03.1998','summa':'500', },


];
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApkColor.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: ApkColor.backgroundColor,
        title: Text('История', style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ApkColor.black
        ),),
      ),
      body:  Padding(
        padding: EdgeInsets.only(left: 20.w,right: 20.w, top: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...list.map((element)=>CardWidget(
                onevent: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const ShowButtonSheetWidget(),
                  );
                },
                name: element['name'],
                date: element['date'],
                summa: element['summa'],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
