import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        centerTitle: true,
        title: Text('Report Screen'),
      ),
      body: Center(
        child: Text('Report Screen'),
      ),
    );
  }
}
