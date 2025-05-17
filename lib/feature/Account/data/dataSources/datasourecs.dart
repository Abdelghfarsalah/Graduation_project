import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/accountapi.dart';
import 'package:graduation_project/core/failuers/accountdeletefailuer.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Account/data/models/updateUserdata.dart';
import 'package:http_parser/http_parser.dart';

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

  Future<Either<bool, Updateuserdata>> updateUseravatar(File imageFile) async {
    final String url = 'http://164.128.130.9:2530/api/v1/user';
    Dio dio = Dio();
    print("object");
    try {
      FormData formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(
          imageFile.path,
          filename: 'upload.jpg',
          contentType: MediaType("image", "jpeg"),
        ),
      });

      var token = await SharedPreferencesDemo.getToken();
      final response = await dio.put(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'User-Agent': 'PostmanRuntime/7.43.4',
            'Accept': '*/*',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Upload success');
        var data = Updateuserdata.fromJson(response.data['data']['user']);
        print(data.avatar);
        await SharedPreferencesDemo.setavatar(data.avatar);
        return Right(Updateuserdata.fromJson(response.data));
      } else {
        print('Upload failed: ${response.statusCode}');
        print('Response data: ${response.data}');
        return Left(false);
      }
    } on DioException catch (e) {
      print('Upload error: ${e.message}');
      if (e.response != null) {
        print('Error response data: ${e.response?.data}');
        print('Error status code: ${e.response?.statusCode}');
      }
      return Left(false);
    } catch (e) {
      print('Unexpected error: $e');
      return Left(false);
    }
  }

  Future<Either<bool, String>> updateUserName(String username) async {
    try {
      FormData formData = FormData.fromMap({'name': username});
      final String url = 'http://164.128.130.9:2530/api/v1/user';
      var token = await SharedPreferencesDemo.getToken();
      final response = await dio.put(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'User-Agent': 'PostmanRuntime/7.43.4',
            'Accept': '*/*',
          },
        ),
      );
      if (response.statusCode == 200) {
        await SharedPreferencesDemo.setUserName(
            response.data['data']['user']['name']);
        return Right(response.data['data']['user']['name']);
      } else {
        print('Upload failed: ${response.statusCode}');
        print('Response data: ${response.data}');
        return Left(false);
      }
    } on Exception {
      return Left(false);
    }
  }
}
