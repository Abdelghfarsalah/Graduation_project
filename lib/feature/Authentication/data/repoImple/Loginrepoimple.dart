import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/failuers/loginFailuer.dart';
import 'package:graduation_project/feature/Authentication/data/apis/AuthDataSources.dart';
import 'package:graduation_project/feature/Authentication/data/models/Usermodel.dart';
import 'package:graduation_project/feature/Authentication/data/models/VerifyEmailModel.dart';
import 'package:graduation_project/feature/Authentication/data/models/resendOtpmodel.dart';
import 'package:graduation_project/feature/Authentication/domain/Entity/registerEntity.dart';
import 'package:graduation_project/feature/Authentication/domain/Entity/userinfo.dart';
import 'package:graduation_project/feature/Authentication/domain/repo/Authrepo.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_state.dart';

class Authrepoimple implements Authrepo {
  final Authdatasources datasource;

  Authrepoimple({required this.datasource});
  @override
  Future<Either<Loginfailuer, LoginEntity>> login(
      {required String email, required String password}) async {
    var response = await datasource.login(email: email, password: password);

    return response.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      return right(ifRight.toDomain());
    });
  }

  @override
  Future<Either<RegisterFailure, RegisterEntity>> register(
      {required String email,
      required String password,
      required String name}) async {
    var response = await datasource.register(
        email: email, password: password, fullname: name);
    return response.fold((ifLeft) {
      return left(ifLeft);
    }, (r) {
      return right(RegisterEntity(
          email: r.data.email, otp: r.data.otp, message: r.data.message));
    });
  }

  @override
  Future<Either<RegisterFailure, VerifyEmailModel>> verifyEmail(
      {required String email, required String otp}) async {
    var response = await datasource.VerifyEmail(email: email, otp: otp);
    return response.fold((ifLeft) {
      return left(ifLeft);
    }, (r) {
      return right(r);
    });
  }

  @override
  Future<Either<RegisterFailure, ResendOtpModel>> resendotp(
      {required String email}) async {
    var response = await datasource.Resendotp(email: email);
    return response.fold((ifLeft) {
      return left(ifLeft);
    }, (r) {
      return right(r);
    });
  }

  @override
  Future<Either<String, String>> forgetPassword({required String email}) async {
    var res = await datasource.forgetPassword(email: email);
    return res.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<String, String>> forgetPasswordReset(
      {required String email, required String newPassword}) async {
    var res = await datasource.forgetPasswordReset(
        email: email, newPassword: newPassword);
    return res.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<String, String>> forgetPasswordVerifyOtp(
      {required String email, required String otp}) async {
    var res = await datasource.forgetPasswordVerifyOtp(email: email, otp: otp);
    return res.fold((l) => left(l), (r) => right(r));
  }
}
