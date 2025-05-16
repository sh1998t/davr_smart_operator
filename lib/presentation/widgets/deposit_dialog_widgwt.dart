import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'drop_down_button.dart';
import 'image_widget.dart';
import 'input_text.dart';
class DepositDialogWidget extends StatefulWidget {
   DepositDialogWidget({super.key});

  @override
  State<DepositDialogWidget> createState() => _DepositDialogWidgetState();
}

class _DepositDialogWidgetState extends State<DepositDialogWidget> {
  final List<Map<String, dynamic>> brenCarName = const [
    {'id': 1, "label": "Napt"},
    {'id': 2, "label": "UzCard"},
    {'id': 3, "label": "Humo"},
  ];

  final List<Map<String, dynamic>> list2 = const [
    {'id': 1, "label": "Бухгалтер"},
    {'id': 2, "label": "Инкассатор"},
  ];

  final List<Map<String, dynamic>> list3 = const [

  ];

  TextEditingController summaEditingController =  TextEditingController();
  TextEditingController inputEditingController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.topCenter,
      backgroundColor: ApkColor.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 4.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Депозит',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: ApkColor.textBlack,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/images/icon_close.svg',
                      fit: BoxFit.fill,
                      width: 24.r,
                      height: 24.r,
                    ),
                  ),
                ],
              ),

              DropDownButtonCarWidget(title: 'Способ оплаты', list: brenCarName),
              DropDownButtonCarWidget(title: 'Кому', list: list2),
              DropDownButtonCarWidget(title: 'Банк', list: list3),
              InputWidget(
                labelText: 'Сумма',
                controller:summaEditingController ,
                inputType: TextInputType.text,
                hintText: '0',),
              InputWidget(
                labelText: 'Комментария',
                controller:inputEditingController ,
                inputType: TextInputType.text,
                hintText: 'Комментария',),
              ImageWidget(),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: ApkColor.buttonColor,
                    side: BorderSide.none,
                    minimumSize: Size(120.w, 45.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: (){}, child: Center(child: Text('Создать +',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: ApkColor.buttonTextColor
              ),
              ),))
            ],
          ),
        ),
      ),
    );
  }
}

