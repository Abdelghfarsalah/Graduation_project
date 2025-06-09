import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/preogressApi.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/RoamapProgress/data/model/userRoadmap.dart';

class Userpreogreaaroadmap {
  final Dio dio;

  Userpreogreaaroadmap({required this.dio});

  Future<Either<bool, UserRoadmapprogress>> GetUseroadmap() async {
    try {
      log("message");
      log("message1254");
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.get(
        Preogressapi.getuserRoadmap,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      UserRoadmapprogress model = UserRoadmapprogress.fromJson(response.data);
      return Right(model);
    } on DioException catch (e) {
      print(e.toString());
      return Left(false); // Error case
    } catch (e) {
      print(e.toString());
      return Left(false);
    }
  }
}
