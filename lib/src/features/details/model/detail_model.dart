class DetailModel {
  final int amount;
  final String from;
  final String to;
  final String id;
  final String bankName;
  final String tType;
  final String description;
  final String createdAt;
  final String authentication;

  DetailModel({
    required this.amount,
    required this.from,
    required this.to,
    required this.id,
    required this.bankName,
    required this.tType,
    required this.description,
    required this.createdAt,
    required this.authentication,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
        amount: json['amount'],
        from: json['from'] ?? "Não identificado",
        to: json['to'] ?? "Não identificado",
        id: json['id'],
        bankName: json['bankName'] ?? "Não identificado",
        tType: json['tType'],
        description: json['description'] ?? "Nenhuma descrição informada" ,
        createdAt: json['createdAt'],
        authentication: json['authentication']);
  }
}
