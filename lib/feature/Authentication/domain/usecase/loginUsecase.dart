import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/failuers/loginFailuer.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Authentication/domain/Entity/userinfo.dart';
import 'package:graduation_project/feature/Authentication/domain/repo/Authrepo.dart';

class Loginusecase {
  final Authrepo authrepo;

  Loginusecase({required this.authrepo});

  Future<Either<Loginfailuer, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    var response = await authrepo.login(email: email, password: password);
    return response.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      SharedPreferencesDemo.saveUserData(
        id: ifRight.user.userId,
        name: ifRight.user.fullName,
        email: ifRight.user.emailAddress,
        isVerified: ifRight.user.isEmailVerified,
        isVerifiedOtp: ifRight.user.isOtpVerified,
        createdAt: ifRight.user.accountCreatedAt,
        updatedAt: ifRight.user.accountUpdatedAt,
        token: ifRight.authToken,
      );
      return right(ifRight);
    });
  }
}
