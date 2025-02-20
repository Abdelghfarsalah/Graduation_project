import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/failuers/loginFailuer.dart';
import 'package:graduation_project/feature/Authentication/data/models/VerifyEmailModel.dart';
import 'package:graduation_project/feature/Authentication/data/models/resendOtpmodel.dart';
import 'package:graduation_project/feature/Authentication/domain/Entity/registerEntity.dart';
import 'package:graduation_project/feature/Authentication/domain/Entity/userinfo.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_state.dart';

abstract class Authrepo {
  Future<Either<Loginfailuer, LoginEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<RegisterFailure, RegisterEntity>> register({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<RegisterFailure, VerifyEmailModel>> verifyEmail({
    required String email,
    required String otp,
  });

  Future<Either<RegisterFailure, ResendOtpModel>> resendotp({
    required String email,
  });

  Future<Either<String, String>> forgetPassword({
    required String email,
  });

  Future<Either<String, String>> forgetPasswordVerifyOtp({
    required String email,
    required String otp,
  });
  Future<Either<String, String>> forgetPasswordReset({
    required String email,
    required String newPassword,
  });
}
