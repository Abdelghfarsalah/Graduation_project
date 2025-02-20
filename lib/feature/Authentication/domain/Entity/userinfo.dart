class LoginEntity {
  final UserModel user;
  final String authToken;

  LoginEntity({required this.user, required this.authToken});
}

class UserModel {
  final String userId;
  final String fullName;
  final String emailAddress;
  final bool isEmailVerified;
  final bool isOtpVerified;
  final String accountCreatedAt;
  final String accountUpdatedAt;
  final int version;

  UserModel({
    required this.userId,
    required this.fullName,
    required this.emailAddress,
    required this.isEmailVerified,
    required this.isOtpVerified,
    required this.accountCreatedAt,
    required this.accountUpdatedAt,
    required this.version,
  });
}
