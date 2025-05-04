import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/accountapi.dart';
import 'package:graduation_project/core/failuers/accountdeletefailuer.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';

class accountdatasources {
  final Dio dio;
  accountdatasources({required this.dio});

  Future<Either<Accountdeletefailuer, bool>> delete() async {
    try {
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.delete(Accountapi.delete,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Right(true);
      } else {
        return Left(Accountdeletefailuer(
          message: 'Failed with status code: ${response.statusCode}',
        ));
      }
    } catch (e) {
      return Left(Accountdeletefailuer(message: e.toString()));
    }
  }
}
