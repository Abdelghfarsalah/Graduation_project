import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/communityApi.dart';
import 'package:graduation_project/core/failuers/groupcommunityfailuer.dart';
import 'package:graduation_project/core/utils/Dioerrorhelper.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';

class Communitydatasourses {
  final Dio dio;

  Communitydatasourses({required this.dio});

  Future<Either<Groupcommunityfailuer, GroupsResponse>> GetAllGroup() async {
    try {
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.get(
        Communityapi.group,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      print(response.data);
      GroupsResponse model = GroupsResponse.fromJson(response.data);
      print(model.message);
      return Right(model); // Success case
    } on DioException catch (e) {
      String errorMessage = Dioerrorhelper.handleDioError(e);
      return Left(Groupcommunityfailuer(message: errorMessage)); // Error case
    } catch (e) {
      print(e.toString());
      return Left(Groupcommunityfailuer(message: "Unexpected error occurred"));
    }
  }
}
