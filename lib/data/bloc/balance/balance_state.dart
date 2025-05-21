part of 'balance_cubit.dart';

@immutable
sealed class BalanceState {}

final class BalanceInitial extends BalanceState {}
final class BalanceLoading extends BalanceState{}
final class BalanceData extends BalanceState{
  final OperatorBalanceModel data;
  BalanceData(this.data);
}
final class BalanceError extends BalanceState{
  final String massage;
  BalanceError(this.massage);
}


