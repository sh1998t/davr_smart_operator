class OperatorBalanceModel {
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

  OperatorBalanceModel({
    required this.allBalance,
    required this.cashBalance,
    required this.uzcardBalance,
    required this.humoBalance,
    required this.visaBalance,
    required this.masterCardBalance,
    required this.updatedAt,
    required this.allBalanceDeposit,
    required this.cashBalanceDeposit,
    required this.uzcardBalanceDeposit,
    required this.humoBalanceDeposit,
    required this.visaBalanceDeposit,
    required this.masterCardBalanceDeposit,
  });

  factory OperatorBalanceModel.fromJson(Map<String, dynamic> json) {
    return OperatorBalanceModel(
      allBalance: json['all_balance'] ,
      cashBalance: json['cash_balance'] ,
      uzcardBalance: json['uzcard_balance'] ,
      humoBalance: json['humo_balance'] ,
      visaBalance: json['visa_balance'],
      masterCardBalance: json['master_card_balance'] ,
      updatedAt: json['updated_at'] as int,
      allBalanceDeposit: json['all_balance_deposit'],
      cashBalanceDeposit: json['cash_balance_deposit'] ,
      uzcardBalanceDeposit: json['uzcard_balance_deposit'] ,
      humoBalanceDeposit: json['humo_balance_deposit'] ,
      visaBalanceDeposit: json['visa_balance_deposit'] ,
      masterCardBalanceDeposit: json['master_card_balance_deposit'] ,
    );
  }
}