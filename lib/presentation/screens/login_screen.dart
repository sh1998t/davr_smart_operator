import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/button_navigation_bar_widget.dart';
import '../widgets/login_input_widget.dart';

class LoginScreen extends StatefulWidget {
  static String name = 'login_screen';
  static String path = '/login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  bool obscurePassword2 = true;

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF572DA6),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 50.h),
                child: Image.asset(
                  "assets/images/login_image.png",
                  width: 290.w,
                  height: 225.h,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 520.h,
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                child: Column(
                  spacing: 0,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h),
                    Text(
                      "Assalomu aleykum",
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Iltimos login va parolni kiriting",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      )
                    ),
                    SizedBox(height: 30.h),
                    LoginInputWidget(
                      hintText: 'Login',
                      controller: loginController,
                      suffix: Icon(Icons.person),
                    ),
                    SizedBox(height: 15.h),
                    LoginInputWidget(
                      hintText: 'Parol',
                      controller: passwordController,
                      obscureText: obscurePassword,
                      suffix: IconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Saqlab qo’yish',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            setState(() {
                              obscurePassword2 = !obscurePassword2;
                            });
                          },
                          child: Container(
                            height: 22.h,
                            width: 22.w,
                            decoration: BoxDecoration(
                              color: Color(0xFFE6F3FF),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xFF3398FF)),
                            ),
                            child:
                                obscurePassword2
                                    ? Icon(Icons.check, size: 16.sp)
                                    : Text(''),
                          ),
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                    SizedBox(height: 45.h),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 130.w, vertical: 18.h),
                          backgroundColor: Color(0xFF572DA6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.sp)
                          )
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ButtonNavigationBarWidget()));
                        }, child: Text('Kirish',style: TextStyle(color:Colors.white,fontSize: 16.sp),))
                    // Center(
                    //   child: Container(
                    //     height: 53.h,
                    //     width: 305.w,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15.r),
                    //     ),
                    //     child: OutlinedButton(
                    //       style: OutlinedButton.styleFrom(
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius:
                    //           BorderRadius.all(Radius.circular(15.r)),
                    //         ),
                    //         backgroundColor: Color(0xFF572DA6),
                    //         side: BorderSide.none,
                    //       ),
                    //       onPressed: isLoading
                    //           ? null
                    //           : () async {
                    //         setState(() {
                    //           isLoading = true;
                    //         });
                    //         try {
                    //           final token =
                    //           await AuthApiRequest().request(
                    //             loginController.text,
                    //             passwordController.text,
                    //           );
                    //
                    //           await AuthUtil.setToken(token);
                    //           Navigator.pushReplacement(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) =>
                    //               const ButtonNavigationBarWidget(),
                    //             ),
                    //           );
                    //         } catch (error) {
                    //           setState(() {
                    //             isLoading = false;
                    //           });
                    //           String errorMessage = error
                    //               .toString()
                    //               .replaceAll("Exception: ", "");
                    //           CherryToast.error(
                    //             animationDuration:
                    //             Duration(milliseconds: 300),
                    //             inheritThemeColors: true,
                    //             animationType: AnimationType.fromTop,
                    //             title: Text('Xatolik!'),
                    //             description: Text(errorMessage),
                    //           ).show(context);
                    //         } finally {
                    //           if (mounted) {
                    //             setState(() {
                    //               isLoading = false;
                    //             });
                    //           }
                    //         }
                    //       },
                    //       child: isLoading
                    //           ? CircularProgressIndicator(
                    //         padding: EdgeInsets.all(6.r),
                    //         color: Colors.white,
                    //         strokeWidth: 3,
                    //       )
                    //           : Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             "Kirish",
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 16.sp,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //           SizedBox(width: 12.w),
                    //           Image.asset(
                    //             'assets/images/Arrow_logo.png',
                    //             height: 16.h,
                    //             width: 16.w,
                    //             fit: BoxFit.cover,
                    //             color: Colors.white,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
