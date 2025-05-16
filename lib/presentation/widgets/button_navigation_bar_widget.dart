import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:davr_smart_operator/presentation/screens/deposit_create_screen.dart';
import 'package:davr_smart_operator/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/history_screen.dart';

class ButtonNavigationBarWidget extends StatefulWidget {
  const ButtonNavigationBarWidget({super.key});
  @override
  State<ButtonNavigationBarWidget> createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBarWidget> {
  var page = 0;
  final pages = [DepositCreateScreen(), HistoryScreen(), ProfileScreen()];
  @override
  void initState() {
    super.initState();

    // context.read<ProcessingCubit>().fetchProcessing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[page],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xFFF5FAFF),
        style: TabStyle.flip,
        color: Colors.deepPurple,
        curveSize: 25,
        top: -25,
        initialActiveIndex: page,

        items: [
          TabItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Icon(Icons.edit_document, color: Colors.black38),
            ),
            activeIcon: Icon(Icons.edit_document, color: Colors.deepPurple),
            title: '',
          ),
          TabItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Icon(Icons.history, color: Colors.black38),
            ),
            activeIcon: Icon(Icons.history, color: Colors.deepPurple),
            title: '',
          ),

          TabItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Icon(Icons.settings, color: Colors.black38),
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
