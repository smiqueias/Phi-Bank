class UserBalanceModel {
  final int amount;

  UserBalanceModel({required this.amount});

  factory UserBalanceModel.fromJson(Map<String, dynamic> json) {
    return UserBalanceModel(
      amount: json['amount'],
    );
  }
}
