import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/TracksHelper.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/models/SingelTrackMode.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/models/staticTrackmodels.dart';

class Statictracksdatasources {
  final Dio dio;

  Statictracksdatasources({required this.dio});

  Future<Either<bool, TracksResponse>> GetAllTracks() async {
    try {
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.get(
        Trackshelper.GetAllTracks,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      TracksResponse model = TracksResponse.fromJson(response.data);
      return Right(model);
    } on DioException catch (e) {
      print(e.toString());
      return Left(false); // Error case
    } catch (e) {
      print(e.toString());
      return Left(false);
    }
  }

  Future<Either<bool, TracksResponse>> SearchTracks(
      {required String name}) async {
    try {
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.get(
        Trackshelper.searchTracksMethod(name),
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      TracksResponse model = TracksResponse.fromJson(response.data);
      return Right(model);
    } on DioException catch (e) {
      print(e.toString());
      return Left(false); // Error case
    } catch (e) {
      print(e.toString());
      return Left(false);
    }
  }

  Future<Either<bool, SingleTrackModel>> GetTrackByID(
      {required String id}) async {
    try {
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.get(
        Trackshelper.getytrackByIdMethod(id),
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      SingleTrackModel model = SingleTrackModel.fromJson(response.data);
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
