import 'package:davr_smart_operator/data/bloc/balance/balance_cubit.dart';
import 'package:davr_smart_operator/data/network/operator_balance_api.dart';
import 'package:davr_smart_operator/presentation/screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/bloc/depisit_bloc/deposit_cubit.dart';
import 'data/network/deposit_api_request.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 3));
  await EasyLocalization.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DepositCubit>(
          create: (context) =>
              DepositCubit(DepositReplenishmentsListRequest()),
        ),
        BlocProvider<BalanceCubit>(
          create: (context) =>
              BalanceCubit(OperatorBalanceApi()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
      
            home: child,
          );
        },
        child: SplashScreen(),
      ),
    );
  }
}
