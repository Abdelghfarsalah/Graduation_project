class ResendOtpModel {
  final bool success;
  final String message;
  final Data data;

  ResendOtpModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResendOtpModel.fromJson(Map<String, dynamic> json) {
    return ResendOtpModel(
      success: json['success'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class Data {
  final String email;
  final String message;

  Data({
    required this.email,
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      email: json['email'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'message': message,
    };
  }
}
