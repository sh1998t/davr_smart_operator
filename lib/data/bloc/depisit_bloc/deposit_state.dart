part of 'deposit_cubit.dart';

@immutable
sealed class DepositState {}

final class DepositInitial extends DepositState {}
final class DepositLoading extends DepositState{}
final class DepositData extends DepositState{
  final List<DepositReplenishmentsModel> data;
  final int totalCount;
  final int pageCount;
  final int currentPage;
  DepositData({
    required this.data,
    required this.totalCount,
    required this.pageCount,
    required this.currentPage
});
}
final class DepositError extends DepositState{
  final String message;
  DepositError(this.message);
}

