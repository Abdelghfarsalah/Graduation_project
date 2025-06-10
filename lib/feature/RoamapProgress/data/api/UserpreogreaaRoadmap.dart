import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/preogressApi.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/RoamapProgress/data/model/userRoadmap.dart';

class Userpreogreaaroadmap {
  final Dio dio;

  Userpreogreaaroadmap({required this.dio});

  Future<Either<bool, UserRoadmapProgress>> GetUseroadmap() async {
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
      UserRoadmapProgress model = UserRoadmapProgress.fromJson(response.data);
      return Right(model);
    } on DioException catch (e) {
      print(e.toString());
      return Left(false); // Error case
    } catch (e) {
      print(e.toString());
      return Left(false);
    }
  }

  Future<Either<bool, UserRoadmapProgress>> completeitem(
      {required int stepNumber,
      required String categoryTitle,
      required String itemTitle}) async {
    try {
      print(stepNumber);
      print(categoryTitle);
      print(itemTitle);
      String token = await SharedPreferencesDemo.getToken() ?? "";

      var response = await dio.post(
        Preogressapi.complete_item,
        data: {
          "stepNumber": stepNumber + 1,
          "categoryTitle": categoryTitle,
          "itemTitle": itemTitle
        },
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      UserRoadmapProgress model = UserRoadmapProgress.fromJson(response.data);
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
