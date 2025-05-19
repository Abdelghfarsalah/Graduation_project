import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/recommendationSysytem.dart';
import 'package:graduation_project/feature/RecommendationSystem/data/models/JobRecommendation.dart';

class Recommenddatasources {
  final Dio dio;

  Recommenddatasources({required this.dio});

  Future<Either<String, List<JobRecommendation>>> recommend(
      Map<String, dynamic> data) async {
    try {
      print(data);
      print("=========================");
      var response = await dio.post(Recommendationsysytemapi.recommend,
          data: data,
          options: Options(headers: {"Content-Type": "application/json"}));

      List<JobRecommendation> JobRecommendations = [];
      print(response.data["top_recommendations"]);
      for (var x in response.data["top_recommendations"]) {
        JobRecommendations.add(JobRecommendation.fromJson(x));
      }

      print(JobRecommendations[0].job);
      print(JobRecommendations[1].job);
      print(JobRecommendations[2].job);
      return Right(JobRecommendations);
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }
}
