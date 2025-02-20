import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/Authapi.dart';
import 'package:graduation_project/core/failuers/loginFailuer.dart';
import 'package:graduation_project/core/utils/Dioerrorhelper.dart';
import 'package:graduation_project/feature/Authentication/data/models/Usermodel.dart';

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
      String errorMessage = Dioerrorhelper.handleDioError(e);
      return Left(Loginfailuer(errorMessage)); // Error case
    } catch (e) {
      return Left(Loginfailuer("Unexpected error occurred"));
    }
  }
}
