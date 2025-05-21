import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:davr_smart_operator/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowButtonSheetWidget extends StatelessWidget {
  final double? amount;
  final int status;
  final String statusName;
  final String? comment;
  final String? operatorPhoto;
  final String bankName;
  final int bankId;
  final String? login;
  final DateTime? createdAt;
  const ShowButtonSheetWidget({super.key,
  required this.amount,
    required this.status,
    required this.login,
    required this.bankId,
     required this.bankName,
    required this.comment,
    required this.statusName,
    this.operatorPhoto,
     this.createdAt

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
            color: ApkColor.white
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h,bottom: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                Center(
                  child: Container(
                    height: 5.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: Color(0xFFAFB8CA)
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Статус ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: ApkColor.black
                    ),),
                    Text(statusName,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: ApkColor.statusTextColor
                    ),),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Сумма ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: ApkColor.black
                      ),),
                    Text('$amount сум',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: ApkColor.summaTextColor
                    ),),
                  ],
                ),
                AppButton(
                    backgroundColor: ApkColor.dropDownColor,
                    width: MediaQuery.of(context).size.width,
                    titleStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: ApkColor.black
                    ), title: 'Документ', onPressed: (){

                })
              ],
            ),
          ),
          Divider(
            color: ApkColor.dividerColor,
            height: 1.2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h,bottom: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10.h,
              children: [
                ColumnWidget(title: 'Логин', text: '$login'),
                ColumnWidget(title: 'Сумма', text: '$amount'),
                ColumnWidget(title: 'Дате', text: '$createdAt'),
                ColumnWidget(title: 'Коммент', text: '$comment'),
                ColumnWidget(title: 'Банк', text: bankName),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: ApkColor.deleteBackgroundColor,
                        side: BorderSide(color: ApkColor.deleteButtonBorderColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)
                        )
                    ),
                    onPressed: (){}, child: Center(
                  child: Text(
                    'Удалить',

                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 15.sp,

                      fontWeight: FontWeight.w500,
                      color:  ApkColor.deleteButtonBorderColor,
                    ),),)),
              ],
            ),
          ),

        ],
        
      ),
    );
  }
}
class ColumnWidget extends StatelessWidget {
  final String? title;
  final String text;
  const ColumnWidget({super.key,  required this.title,required this.text,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 5.h,
      children: [
        Text("$title",style: TextStyle(
          fontSize: 18.sp,
          height: 0,
          fontWeight: FontWeight.w500,
          color: ApkColor.labelColor,
        ),),
        Text("$text",style: TextStyle(
          fontSize: 18.sp,
          height: 0,
          fontWeight: FontWeight.w500,
          color: ApkColor.black,
        ),),
      ],
    );
  }
}
