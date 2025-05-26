import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Authentication/data/models/VerifyEmailModel.dart';
import 'package:graduation_project/feature/Authentication/domain/repo/Authrepo.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_state.dart';

class VerifyEmailusecase {
  final Authrepo repo;

  VerifyEmailusecase({required this.repo});
  Future<Either<RegisterFailure, VerifyEmailModel>> VerifyEmail({
    required String email,
    required String otp,
  }) async {
    var response = await repo.verifyEmail(email: email, otp: otp);
    return response.fold((ifLeft) => left(ifLeft), (ifRight) {
      SharedPreferencesDemo.saveUserData(
        id: "ifRight.user.userId",
        name: ifRight.data.user.name,
        email: ifRight.data.user.email,
        isVerified: false,
        isVerifiedOtp: true,
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
        token: ifRight.data.token,
        avatar: ifRight.data.user.avatar.length == 0
            ? "https://images.icon-icons.com/1378/PNG/512/avatardefault_92824.png"
            : ifRight.data.user.avatar,
      );
      return right(ifRight);
    });
  }
}
