class UserStatementModel {
  final List<Statement> statements;

  UserStatementModel({required this.statements});

  factory UserStatementModel.fromJson(Map<String, dynamic> json) {
    return UserStatementModel(
        statements: List.from(
            json["items"].map((e) => Statement.fromJson(e)).toList()));
  }
}

class Statement {
  final String id;
  final String description;
  final String? to;
  final String createdAt;
  final String tType;
  final int amount;

  Statement({
    required this.to,
    required this.id,
    required this.description,
    required this.createdAt,
    required this.tType,
    required this.amount,
  });

  factory Statement.fromJson(Map<String, dynamic> json) {
    return Statement(
      id: json['id'],
      description: json['description'],
      createdAt: json['createdAt'],
      tType: json['tType'],
      to: json['to'] ?? "",
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['createdAt'] = createdAt;
    _data['to'] = to;
    _data['tType'] = tType;
    _data['amount'] = amount;
    return _data;
  }
}
