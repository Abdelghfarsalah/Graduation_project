class VerifyEmailModel {
  final bool success;
  final String message;
  final VerifyEmailData data;

  VerifyEmailModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailModel(
      success: json['success'],
      message: json['message'],
      data: VerifyEmailData.fromJson(json['data']),
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

class VerifyEmailData {
  final String token;
  final UserModel user;

  VerifyEmailData({
    required this.token,
    required this.user,
  });

  factory VerifyEmailData.fromJson(Map<String, dynamic> json) {
    return VerifyEmailData(
      token: json['token'],
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user.toJson(),
    };
  }
}

class UserModel {
  final String name;
  final String email;

  UserModel({
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
