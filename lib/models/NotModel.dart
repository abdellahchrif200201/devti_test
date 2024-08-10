class NotModel {
  final String imageUser;
  final String date;
  final String nameUser;
  final String company;
  final String status;
  final String codeID;

  NotModel({
    required this.imageUser,
    required this.date,
    required this.nameUser,
    required this.company,
    required this.status,
    required this.codeID,
  });

  // Factory method to create an instance of NotModel from JSON
  factory NotModel.fromJson(Map<String, dynamic> json) {
    return NotModel(
      imageUser: json['imageUser'] as String,
      date: json['date'] as String,
      nameUser: json['username'] as String,
      company: json['company'] as String,
      status: json['status'] as String,
      codeID: json['orderId'] as String,
    );
  }
}
