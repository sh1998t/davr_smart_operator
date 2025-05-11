import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:davr_smart_operator/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/show_button_sheet_widget.dart';
List<Map<String, dynamic>> list =[
  {'name':'Shavkat','date':'12,03.1998','summa':'500', },


];
class DepositCreateScreen extends StatelessWidget {
  const DepositCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ApkColor.backgroundColor,
        centerTitle: true,
        title: Text(' Deposit Screen'),
      ),
      backgroundColor: ApkColor.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 20.w,right: 20.w, top: 10.h),
        child: Column(
          children: [
            ...list.map((element)=>CardWidget(
              onevent: () {
                showModalBottomSheet(
                 context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,

                    builder: (BuildContext context){
               return ShowButtonSheetWidget();
             });
              },
              name: element['name'],
              date: element['date'],
              summa: element['summa'],
            )),
          ],
        ),
      ),
    );
  }
}
