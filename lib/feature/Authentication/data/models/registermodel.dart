class RegisterModel {
  final bool success;
  final String message;
  final RegisterData data;

  RegisterModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: RegisterData.fromJson(json["data"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
      "data": data.toJson(),
    };
  }
}

class RegisterData {
  final String email;
  final String otp;
  final String message;

  RegisterData({
    required this.email,
    required this.otp,
    required this.message,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      email: json["email"] ?? "",
      otp: json["otp"] ?? "",
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "otp": otp,
      "message": message,
    };
  }
}
