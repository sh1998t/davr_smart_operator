import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'drop_down_button.dart';
import 'image_widget.dart';
import 'input_text.dart';
class DepositDialogWidget extends StatefulWidget {
  final int? allBalance;
  final int? cashBalance;
  final int? uzcardBalance;
  final int? humoBalance;
  final int? visaBalance;
  final int? masterCardBalance;
  final int? updatedAt;
  final int? allBalanceDeposit;
  final int? cashBalanceDeposit;
  final int? uzcardBalanceDeposit;
  final int? humoBalanceDeposit;
  final int? visaBalanceDeposit;
  final int? masterCardBalanceDeposit;
   const DepositDialogWidget({super.key,
      this.allBalance,
      this.cashBalance,
      this.uzcardBalance,
      this.humoBalance,
      this.visaBalance,
      this.masterCardBalance,
      this.updatedAt,
      this.allBalanceDeposit,
      this.cashBalanceDeposit,
      this.uzcardBalanceDeposit,
      this.humoBalanceDeposit,
      this.visaBalanceDeposit,
      this.masterCardBalanceDeposit,
   });

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
  TextEditingController codeEditingController =  TextEditingController();
  Map<String, dynamic>? _selectedPaymentMethod;
  Map<String, dynamic>? _selectedRecipient;
  Map<String, dynamic>? _selectedBank;
  @override
  void initState() {
    super.initState();
  }
  int selectedBalanceLimit = 0;

  List<TextInputFormatter> _getBalanceInputFormatter() {
    return [
      FilteringTextInputFormatter.digitsOnly,
      TextInputFormatter.withFunction((oldValue, newValue) {
        final int newInt = int.tryParse(newValue.text) ?? 0;
        if (newInt > selectedBalanceLimit || newInt < 0) {
          return oldValue;
        }
        return newValue;
      }),
    ];
  }


  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.topCenter,
      backgroundColor: ApkColor.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 4.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Form(
        autovalidateMode: AutovalidateMode.onUnfocus,
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 6.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Депозит',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: ApkColor.textBlack,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: SvgPicture.asset(
                        'assets/images/svg/icon_close.svg',
                        fit: BoxFit.fill,
                        width: 24.r,
                        height: 24.r,
                      ),
                    ),
                  ],
                ),
                DropDownButtonCarWidget(
                  title: 'Способ оплаты',
                  list: brenCarName,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                      selectedBalanceLimit = 0;
                      switch (value['label']) {
                        case 'Napt':
                          selectedBalanceLimit = (widget.cashBalance ?? 0) - (widget.cashBalanceDeposit ?? 0);
                          break;
                        case 'UzCard':
                          selectedBalanceLimit = (widget.uzcardBalance ?? 0) - (widget.uzcardBalanceDeposit ?? 0);
                          break;
                        case 'Humo':
                          selectedBalanceLimit = (widget.humoBalance ?? 0) - (widget.humoBalanceDeposit ?? 0);
                          break;
                      }
                      summaEditingController.text = selectedBalanceLimit.toString();
                    });

                  },
                  selectedCarId: _selectedPaymentMethod,
                ),

                DropDownButtonCarWidget(
                  title: 'Кому',
                  list: list2,
                  onChanged: (value) {
                    setState(() {
                      _selectedRecipient = value;
                      // Reset values on change
                      _selectedBank = null;
                      inputEditingController.clear();
                    });
                  },
                  selectedCarId: _selectedRecipient,
                ),

                if (_selectedRecipient != null &&
                    _selectedRecipient!['label'] == 'Бухгалтер')
                  DropDownButtonCarWidget(
                    title: 'Банк',
                    list: list3,
                    onChanged: (value) {
                      setState(() {
                        _selectedBank = value;
                      });
                    },
                    selectedCarId: _selectedBank,
                  )
                else if (_selectedRecipient != null &&
                    _selectedRecipient!['label'] == 'Инкассатор')
                  MainTextField(
                    title: 'Код инкассатора',
                    controller: codeEditingController,
                    keyboardType: TextInputType.text,
                    hintText: 'Код инкассатора',
                  ),

                MainTextField(
                  title: 'Сумма',
                  controller:summaEditingController ,
                  keyboardType: TextInputType.text,
                  hintText: '0',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Сумма не может быть пустой';
                    }

                    final enteredAmount = int.tryParse(value);
                    if (enteredAmount == null) {
                      return 'Введите допустимое число';
                    }

                    if (enteredAmount <= 0) {
                      return 'Сумма должна быть больше 0';
                    }

                    if (enteredAmount > selectedBalanceLimit) {
                      return 'Сумма не должна превышать $selectedBalanceLimit';
                    }

                    return null; // Valid
                  },

                  inputFormatters: _getBalanceInputFormatter(),
                ),

                MainTextField(
                  title: 'Комментария',
                  controller:inputEditingController,
                  keyboardType: TextInputType.text,
                  hintText: 'Комментария',),

                SizedBox(height: 0.h,),
                ImageWidget(),
                SizedBox(height: 0.h,),
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
      ),
    );
  }
}

