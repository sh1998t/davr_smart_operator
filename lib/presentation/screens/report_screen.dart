import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/date _time_widget.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final List<Map<String, dynamic>> list = [
    {'title': 'Логин кассира', 'text': 'Ilhom'},
    {'title': 'Название кассы', 'text': 'Sergile'},
    {'title': 'Время от', 'text': '2025-05-08 00:00:00'},
    {'title': 'Время до', 'text': '2025-05-08 23:59:59'},
    {'title': 'Задолженность Fill (351) x 32', 'text': '0'},
    {'title': 'Задолженность наличный', 'text': '0'},
    {'title': 'Задолженность Uzcard', 'text': '0'},
    {'title': 'Задолженность Humo', 'text': '0'},
    {'title': 'Задолженность Visa', 'text': '0'},
    {'title': 'Задолженность MasterCard', 'text': '0'},
    {'title': 'Инкассированы', 'text': '0'},
    {'title': 'Разница в сумме услуг', 'text': '0'},
    {'title': 'Общее количество', 'text': '0'},
    {'title': 'Общая сумма', 'text': '0'},
    {'title': 'Количество услуг агента', 'text': '0'},
    {'title': 'Сумма услуг агента', 'text': '0'},
    {'title': 'Количество заявлений', 'text': '0'},
    {'title': 'Сумма блюденных платежей', 'text': '0'},
    {'title': 'Сумма наличным', 'text': '0'},
    {'title': 'Сумма Humo', 'text': '0'},
    {'title': 'Сумма uzcard', 'text': '0'},
    {'title': 'Сумма услуг агента', 'text': '0'},
    {'title': 'Остаток', 'text': '0'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ApkColor.backgroundColor,
      appBar: AppBar(
        backgroundColor:ApkColor.backgroundColor,
        centerTitle: true,
        title: Text(
          'Сводный отчёт',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 10.h,
            children: [
              DateTimeToWidget(),
              ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = list[index];
                  return Container(
                     color: index.isEven ? Colors.grey[200] : Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(item['title'], style: TextStyle(fontSize: 14.sp))),
                        SizedBox(width: 16.w),
                        Text(item['text'], style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
