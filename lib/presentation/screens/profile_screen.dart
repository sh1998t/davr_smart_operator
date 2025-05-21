import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:davr_smart_operator/presentation/screens/report_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApkColor.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Container(
                  height: 280.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF4B3AB0), Color(0xFF9661C7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ilhom Ahmadov',
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'CO1313',
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 175.h,
                child: SvgPicture.asset('assets/images/svg/profile_person.svg',
                  width: 107.r,height: 107.r,fit: BoxFit.fill,),
              ),
            ],
          ),
         Padding(padding: EdgeInsets.symmetric(horizontal: 18.w),
           child:Column(
             spacing: 12.h,
             children: [
               SizedBox(height: 50.h,),
               Row(
                 children: [
                    SvgPicture.asset('assets/images/svg/icons_location.svg',
                      width: 36.r,height: 36.r,fit: BoxFit.fill,),
                   SizedBox(width: 10.w,),
                   Text('SERGELI', style: TextStyle(
                     fontSize: 22.sp,
                     fontWeight: FontWeight.w500,
                     color: ApkColor.black
                   ),)
                 ],
               ),
               InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder:(context)=> ReportScreen()));
                 },
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         SvgPicture.asset('assets/images/svg/report_icon.svg',
                           width: 36.r,height: 36.r,fit: BoxFit.fill,),
                         SizedBox(width: 10.w,),
                         Text('Сводный отчёт', style: TextStyle(
                             fontSize: 22.sp,
                             fontWeight: FontWeight.w500,
                             color: ApkColor.black
                         ),),
                       ],
                     ),
                     SvgPicture.asset('assets/images/svg/arrow_right.svg',
                       width: 20.r,height: 20.r,fit: BoxFit.fill,),
                   ],
                 ),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(
                     children: [
                       SvgPicture.asset('assets/images/svg/tdesign_money.svg',
                         width: 36.r,height: 36.r,fit: BoxFit.fill,),
                       SizedBox(width: 10.w,),
                       Text('Баланс', style: TextStyle(
                           fontSize: 22.sp,
                           fontWeight: FontWeight.w500,
                           color: ApkColor.black
                       ),),
                     ],
                   ),
                   Text('18 158 000 сум', style: TextStyle(
                       fontSize: 22.sp,
                       fontWeight: FontWeight.w500,
                       color: ApkColor.black
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
                           SvgPicture.asset('assets/images/svg/delete.svg',fit: BoxFit.fill, width: 60.r,height:60.r,),
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
                   children: [
                     SvgPicture.asset('assets/images/svg/logout.svg',
                       width: 36.r,height: 36.r,fit: BoxFit.fill,),
                     SizedBox(width: 10.w,),
                     Text('Выйти', style: TextStyle(
                         fontSize: 22.sp,
                         fontWeight: FontWeight.w500,
                         color: ApkColor.black
                     ),),
                   ],
                 ),
               ),
             ],
           ),
         ),
        ],
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 120.h);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 120.h);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

