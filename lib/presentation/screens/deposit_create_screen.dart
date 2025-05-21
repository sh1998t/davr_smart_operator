import 'package:davr_smart_operator/core/apk_color.dart';
import 'package:davr_smart_operator/data/bloc/depisit_bloc/deposit_cubit.dart';
import 'package:davr_smart_operator/presentation/widgets/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/bloc/balance/balance_cubit.dart';
import '../widgets/deposit_dialog_widgwt.dart';
import '../widgets/show_button_sheet_widget.dart';

class DepositCreateScreen extends StatefulWidget {
  const DepositCreateScreen({super.key});

  @override
  State<DepositCreateScreen> createState() => _DepositCreateScreenState();
}

class _DepositCreateScreenState extends State<DepositCreateScreen> {
  @override
  void initState() {
    context.read<DepositCubit>().fetchDeposits();
    context.read<BalanceCubit>().fetchBalance();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ApkColor.backgroundColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding:  EdgeInsets.only(left: 15.w),
          child: Text('Deposit Screen'),
        ),
        actions: [
          BlocBuilder<BalanceCubit, BalanceState>(
          builder: (context, state) {
            if(state is BalanceLoading){
              return Center(child: CircularProgressIndicator(),);
            }else if (state is BalanceData){
              return Padding(padding: EdgeInsets.only(right: 24.w),
                child: IconButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context){
                            final data =state.data;
                            return Container(
                                margin: EdgeInsets.symmetric(horizontal: 25.sp),
                                child: DepositDialogWidget(
                                  allBalance: data.allBalance,
                                  allBalanceDeposit: data.allBalanceDeposit,
                                  cashBalance: data.cashBalance,
                                  cashBalanceDeposit: data.cashBalanceDeposit,
                                  uzcardBalance: data.uzcardBalance,
                                  uzcardBalanceDeposit: data.uzcardBalanceDeposit,
                                  humoBalance: data.humoBalance,
                                  humoBalanceDeposit: data.humoBalanceDeposit,
                                  masterCardBalance: data.masterCardBalance,
                                  masterCardBalanceDeposit: data.masterCardBalanceDeposit,
                                  visaBalance: data.visaBalance,
                                  visaBalanceDeposit: data.visaBalanceDeposit,
                                  updatedAt: data.updatedAt,
                                ));
                          });
                    }, icon: SvgPicture.asset('assets/images/svg/add_icon.svg', width: 30.r,height: 30.r,fit: BoxFit.contain,)
                ),
              );
            }else if (state is BalanceError){
              return Center(child: Text(state.massage),);
            }
            return SizedBox.shrink();

  },
),

        ],
      ),
      backgroundColor: ApkColor.backgroundColor,
      body: BlocBuilder<DepositCubit, DepositState>(
  builder: (context, state) {
    if(state is DepositLoading){
      return Center(child: CircularProgressIndicator(),);
    }else if (state is DepositError){
      return Center(child: Text(state.message),);
    } else if(state is DepositData){
      final deposit = state.data;
      return Padding(
        padding: EdgeInsets.only(left: 20.w,right: 20.w, top: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...deposit.map((element)=>CardWidget(
                onevent: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => ShowButtonSheetWidget(
                      amount: element.amount ?? 0,
                      status: element.status ?? 0,
                      login: element.login ?? 'Noma\'lum',
                      bankId: element.bankId ?? 0,
                      bankName: element.bankName ?? 'Noma\'lum',
                      comment: element.comment ?? '',
                      statusName: element.statusName ?? 'Noma\'lum',
                      createdAt: element.createdAt,
                    ),
                  );
                },
                name: element.login ?? 'Noma\'lum',
                date: element.createdAt ?? 'Noma\'lum',
                summa: element.amount ?? null,
              )),
            ],
          ),
        ),
      );
    }
    return Center(
      child: Text('data'),
    );
  },
),
    );
  }
}
