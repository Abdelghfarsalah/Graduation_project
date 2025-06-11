import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/Authapi.dart';
import 'package:graduation_project/core/failuers/loginFailuer.dart';
import 'package:graduation_project/core/utils/Dioerrorhelper.dart';
import 'package:graduation_project/feature/Authentication/data/models/Usermodel.dart';
import 'package:graduation_project/feature/Authentication/data/models/VerifyEmailModel.dart';
import 'package:graduation_project/feature/Authentication/data/models/registermodel.dart';
import 'package:graduation_project/feature/Authentication/data/models/resendOtpmodel.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_state.dart';

class Authdatasources {
  final Dio dio;

  Authdatasources({required this.dio});

  Future<Either<Loginfailuer, LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        Authapi.login,
        data: {"email": email, "password": password},
        options: Options(),
      );

      LoginResponse model = LoginResponse.fromJson(response.data);
      return Right(model); // Success case
    } on DioException catch (e) {
      print(e.toString());
      String errorMessage = Dioerrorhelper.handleDioError(e);
      return Left(Loginfailuer(errorMessage)); // Error case
    } catch (e) {
      print(e.toString());
      return Left(Loginfailuer("Unexpected error occurred"));
    }
  }

  Future<Either<RegisterFailure, RegisterModel>> register({
    required String email,
    required String password,
    required String fullname,
  }) async {
    try {
      var response = await dio.post(
        Authapi.register,
        data: {"email": email, "password": password, "name": fullname},
      );
      return Right(RegisterModel.fromJson(response.data));
    } catch (e) {
      return Left(RegisterFailure(error: "Error"));
    }
  }

  Future<Either<RegisterFailure, VerifyEmailModel>> VerifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      var response = await dio
          .post(Authapi.verifyemail, data: {"email": email, "otp": otp});
      print(response.data['data']['user']['avatar']);
      return Right(VerifyEmailModel.fromJson(response.data));
    } on DioException catch (e) {
      String errorMessage = Dioerrorhelper.handleDioError(e);
      return Left(RegisterFailure(error: errorMessage));
    } catch (e) {
      return Left(RegisterFailure(error: "Unexpected error occurred"));
    }
  }

  Future<Either<RegisterFailure, ResendOtpModel>> Resendotp({
    required String email,
  }) async {
    try {
      var response = await dio.post(Authapi.resendotp, data: {"email": email});

      return Right(ResendOtpModel.fromJson(response.data));
    } on DioException catch (e) {
      String errorMessage = Dioerrorhelper.handleDioError(e);
      return Left(RegisterFailure(error: errorMessage));
    } catch (e) {
      return Left(RegisterFailure(error: "Unexpected error occurred"));
    }
  }

  Future<Either<String, String>> forgetPassword({
    required String email,
  }) async {
    try {
      var response =
          await dio.post(Authapi.forgotpassword, data: {"email": email});

      return Right(response.data["message"] ?? "تم إرسال رابط إعادة التعيين");
    } catch (e) {
      return Left("حدث خطأ أثناء إعادة تعيين كلمة المرور: ${e.toString()}");
    }
  }

  Future<Either<String, String>> forgetPasswordVerifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      var response = await dio.post(
        Authapi.verifypasswordOTP,
        data: {"email": email, "otp": otp},
      );

      return right(response.data["message"] ?? "تم التحقق من OTP بنجاح");
    } catch (e) {
      return left("خطأ في التحقق من OTP: ${e.toString()}");
    }
  }

  Future<Either<String, String>> forgetPasswordReset({
    required String email,
    required String newPassword,
  }) async {
    try {
      var response = await dio.put(
        Authapi.resetpassword,
        data: {"email": email, "newPassword": newPassword},
      );
      return Right(response.data["message"] ?? "تم تغيير كلمة المرور بنجاح");
    } catch (e) {
      return Left(" ${e.toString()}");
    }
  }

  Future<Either<String, String>> Google() async {
    try {
      var response = await dio.get(
        Authapi.google,
      );
      return Right(response.data ?? "تم تغيير كلمة المرور بنجاح");
    } catch (e) {
      return Left(" ${e.toString()}");
    }
  }
}
