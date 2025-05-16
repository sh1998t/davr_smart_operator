import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:davr_smart_operator/presentation/screens/login_screen.dart';
import 'package:davr_smart_operator/presentation/screens/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApkColor.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ApkColor.backgroundColor,
        centerTitle: true,
        title: Text('Profile',style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 32.sp,
          fontWeight: FontWeight.w400,
          color: ApkColor.black
        ),),
      ),
      body: Column(
        children: [
         Padding(
           padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h,),
           child: Row(
            children: [
              Image.asset('assets/images/person.png',
                width: 60.r,
                height: 60.r,
                fit: BoxFit.fill,),
              SizedBox(width: 20.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ilhom',
                    style: TextStyle(
                    fontSize:23.sp,
                      fontWeight: FontWeight.w400,
                      color: ApkColor.blackColor2 ,
                  ),),
                  Text('C01313 ',
                    style: TextStyle(
                      fontSize:13.sp,
                      fontWeight: FontWeight.w400,
                      color: ApkColor.blackColor3 ,
                    ),),
                ],
              )
            ],
                   ),
         ),
        SizedBox(height:20.h ,),
        Container(
          width: MediaQuery.of(context).size.width,
          color: ApkColor.white,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            spacing: 10.h,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('точка', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 22.sp, fontWeight: FontWeight.w500,
                    color:ApkColor.black,
                  ),),
                  Text('SERGELI', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 22.sp, fontWeight: FontWeight.w500,
                    color:ApkColor.black,
                  ),),
                ],
              ), 
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Сводный отчёт', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 22.sp, fontWeight: FontWeight.w500,
                      color:ApkColor.black,
                    ),),
                   SvgPicture.asset('assets/images/arrow_right.svg',width: 20.r, height: 20.r,fit: BoxFit.fill,),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Баланс', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 22.sp, fontWeight: FontWeight.w500,
                    color:ApkColor.black,
                  ),),
                  Text('25 367 786 сум', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 22.sp, fontWeight: FontWeight.w500,
                    color:ApkColor.black,
                  ),),
                ],
              ),
              InkWell(
                onTap: (){
                 showModalBottomSheet(
                     isScrollControlled: true,
                     backgroundColor: Colors.transparent,
                     context: context, builder: (context){
                   return Container(
                     width: MediaQuery.of(context).size.width,
                     padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h, bottom: 35.h),
                     decoration: BoxDecoration(
                       color: ApkColor.white,
                       borderRadius: BorderRadius.only(
                         topRight: Radius.circular(20.r),
                         topLeft: Radius.circular(20.r),
                       ),
                     ),
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       spacing: 12.h,
                       children: [
                        SvgPicture.asset('assets/images/delete.svg',fit: BoxFit.fill, width: 60.r,height:60.r,),
                        Text('Вы уверены, что хотите удалить свою учетную запись?'
                          , style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700, color: ApkColor.black
                        ),
                        textAlign: TextAlign.start,
                        ),
                         Text('Пожалуйста, проверьте еще раз, вы полностью выходите из своей учетной записи.'
                           , style: TextStyle(
                               fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.grey
                           ),
                           textAlign: TextAlign.start,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             OutlinedButton(
                                 style: OutlinedButton.styleFrom(
                                     minimumSize:Size(160.w, 50.h),
                                     backgroundColor: ApkColor.dropDownColor,
                                     side: BorderSide.none,
                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(8.r)
                                     )
                                 ),
                                 onPressed: (){
                                   Navigator.pop(context);
                                 }, child: Center(
                               child: Text(
                                 'Отменить',

                                 style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                   fontSize: 15.sp,
                                   fontWeight: FontWeight.w500,
                                   color:  ApkColor.black,
                                 ),),)),
                             OutlinedButton(
                                 style: OutlinedButton.styleFrom(
                                   minimumSize:Size(160.w, 50.h),
                                     backgroundColor: ApkColor.deleteBackgroundColor,
                                     side: BorderSide(color: ApkColor.deleteButtonBorderColor),

                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(8.r)
                                     )
                                 ),
                                 onPressed: (){}, child: Center(
                               child: Text(
                                 'Выйти',

                                 style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                   fontSize: 15.sp,

                                   fontWeight: FontWeight.w600,
                                   color:  ApkColor.deleteButtonBorderColor,
                                 ),),)),
                           ],
                         )
                       ],
                     ),
                   );
                 });
                  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Выйти', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 22.sp, fontWeight: FontWeight.w500,
                      color:ApkColor.black,
                    ),),
                    SvgPicture.asset('assets/images/logout.svg',width: 25.r, height: 25.r,fit: BoxFit.fill,),

                  ],
                ),
              ),
            ],
          ),
  ),
        ],
      )
    );
  }
}
