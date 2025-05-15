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
      height: MediaQuery.of(context).size.height*0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
            color: ApkColor.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ApkColor.backgroundColor,

              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),

            ),
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.close,
                      color: ApkColor.black,
                      size: 24.r,)),
                Text('Статус ',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple
                ),),

                Text('В транзите ',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),
                SizedBox(height: 5.h,),
                Text('100',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16.sp,
                    color: Colors.black,
                  fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    AppButton(
                        backgroundColor: ApkColor.white,
                        width: MediaQuery.of(context).size.width *0.45,
                        titleStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ApkColor.black
                        ), title: 'редактировать', onPressed: (){

                    }),
                    AppButton(
                        backgroundColor: ApkColor.white,
                        width: MediaQuery.of(context).size.width *0.4,
                        titleStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ApkColor.black
                        ), title: 'Документ', onPressed: (){

                    }),
                ],)
              ],
            ),
          ),
          ColumnWidget(title: 'Логин', text: 'Shavkat'),
          ColumnWidget(title: 'Сумма', text: '100'),
          ColumnWidget(title: 'Дате', text: '12.03.1998'),
          ColumnWidget(title: 'Коммент', text: 'salom'),
          ColumnWidget(title: 'Банк', text: 'Unversal Bank'),
        ],
      ),
    );
  }
}
class ColumnWidget extends StatelessWidget {
  final String title;
  final String text;
  const ColumnWidget({super.key,  required this.title,required this.text,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3.h,
        children: [
          Text(title,style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),),
          Text(text,style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),),
        ],
      ),
    );
  }
}
