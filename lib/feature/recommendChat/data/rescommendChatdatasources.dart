import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/preogressApi.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/recommendChat/data/models/addroadmapmodel.dart';

class Rescommendchatdatasources {
  final Dio dio;

  Rescommendchatdatasources({required this.dio});

  Future<Either<bool, AddRoadmapModel>> AddRoadmapForLearning(
      Map<String, dynamic> roadmap) async {
    try {
      log("message");
      print(roadmap);
      log("message1254");
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.post(
        Preogressapi.AddRoadmap,
        data: {"roadmap": roadmap},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      AddRoadmapModel model = AddRoadmapModel.fromJson(response.data);
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
