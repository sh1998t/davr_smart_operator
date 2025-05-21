import 'package:bloc/bloc.dart';
import 'package:davr_smart_operator/data/model/operator_balance_model.dart';
import 'package:davr_smart_operator/data/network/operator_balance_api.dart';
import 'package:meta/meta.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  OperatorBalanceApi apiRequest;

  BalanceCubit(this.apiRequest) : super(BalanceInitial());

  Future<void> fetchBalance() async {
    emit(BalanceLoading());
    try {
      final balance = await OperatorBalanceApi().request();
      emit(BalanceData(balance));
    } catch (e) {
      emit(BalanceError(e.toString()));
    }
  }
}