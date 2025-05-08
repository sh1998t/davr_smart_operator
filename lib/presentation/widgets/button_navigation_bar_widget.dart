import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:davr_smart_operator/presentation/screens/deposit_create_screen.dart';
import 'package:davr_smart_operator/presentation/screens/profile_screen.dart';
import 'package:davr_smart_operator/presentation/screens/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonNavigationBarWidget extends StatefulWidget {
  final int initialIndex;
  const ButtonNavigationBarWidget({super.key, this.initialIndex = 0});
  @override
  State<ButtonNavigationBarWidget> createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBarWidget> {
  var page = 0;
  final pages = [DepositCreateScreen(), ReportScreen(), ProfileScreen()];
  @override
  void initState() {
    super.initState();
    page = widget.initialIndex;
    // context.read<ProcessingCubit>().fetchProcessing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[page],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xFFF5FAFF),
        cornerRadius: 5,
        style: TabStyle.fixedCircle,
        color: Colors.deepPurple,
        curveSize: 25,
        top: -25,
        initialActiveIndex: page,
        height: 60.h,
        items: [
          TabItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Icon(Icons.edit_document, color: Colors.white38),
            ),
            activeIcon: Icon(Icons.edit_document, color: Colors.deepPurple),
            title: '',
          ),
          TabItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Icon(Icons.account_balance, color: Colors.white38),
            ),
            activeIcon: Icon(Icons.account_balance, color: Colors.deepPurple),
            title: '',
          ),

          TabItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Icon(Icons.settings, color: Colors.white38),
            ),
            activeIcon: Icon(Icons.settings, color: Colors.deepPurple),
            title: '',
          ),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
    );
  }
}
