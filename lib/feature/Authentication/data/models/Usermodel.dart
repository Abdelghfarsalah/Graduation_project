import 'package:graduation_project/feature/Authentication/domain/Entity/userinfo.dart';

class LoginResponse {
  final bool success;
  final String message;
  final LoginData data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: LoginData.fromJson(json['data'] ?? {}),
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'success': success,
  //     'message': message,
  //     'data': data.toJson(),
  //   };
  // }
}

class LoginData {
  final User user;
  final String token;

  LoginData({
    required this.user,
    required this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: User.fromJson(json['user'] ?? {}),
      token: json['token'] ?? '',
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'user': user.toJson(),
  //     'token': token,
  //   };
  // }
}

class User {
  final String id;
  final String name;
  final String email;
  final bool isVerified;
  final bool isVerifiedOtp;
  final String createdAt;
  final String updatedAt;
  final int v;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isVerified,
    required this.isVerifiedOtp,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      isVerified: json['isVerified'] ?? false,
      isVerifiedOtp: json['isVerifiedotp'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     '_id': id,
  //     'name': name,
  //     'email': email,
  //     'isVerified': isVerified,
  //     'isVerifiedotp': isVerifiedOtp,
  //     'createdAt': createdAt,
  //     'updatedAt': updatedAt,
  //     '__v': v,
  //   };
  // }
}

extension LoginResponseMapper on LoginResponse {
  LoginEntity toDomain() {
    return LoginEntity(
      user: data.user.toDomain(),
      authToken: data.token,
    );
  }
}

extension UserMapper on User {
  UserModel toDomain() {
    return UserModel(
      userId: id,
      fullName: name,
      emailAddress: email,
      isEmailVerified: isVerified,
      isOtpVerified: isVerifiedOtp,
      accountCreatedAt: createdAt,
      accountUpdatedAt: updatedAt,
      version: v,
    );
  }
}
