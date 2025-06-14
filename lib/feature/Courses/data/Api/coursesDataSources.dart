import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/coursesHelper.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Courses/domain/models/CourseWithProgressResponse.dart';
import 'package:graduation_project/feature/Courses/domain/models/CoursesResponse.dart';
import 'package:graduation_project/feature/Courses/domain/models/Enrollmentmodel.dart';
import 'package:graduation_project/feature/Courses/domain/models/UserCoursesMode.dart';

class Coursesdatasources {
  final Dio dio;

  Coursesdatasources({required this.dio});

  Future<Either<bool, CoursesResponse>> GetAllCourses() async {
    try {
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.get(
        Courseshelper.getallcoursesApi,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      CoursesResponse model = CoursesResponse.fromJson(response.data);
      return Right(model); // Success case
    } on DioException catch (e) {
      print(e.toString());
      // String errorMessage = Dioerrorhelper.handleDioError(e);
      return Left(false); // Error case
    } catch (e) {
      return Left(false);
    }
  }

  Future<Either<bool, UserCoursesModel>> GetUserCourses() async {
    try {
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.get(
        Courseshelper.GetUserCourses,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      UserCoursesModel model = UserCoursesModel.fromJson(response.data);
      return Right(model); // Success case
    } on DioException catch (e) {
      print(e.toString());

      // String errorMessage = Dioerrorhelper.handleDioError(e);
      return Left(false); // Error case
    } catch (e) {
      return Left(false);
    }
  }

  Future<Either<bool, CoursesResponse>> SearcForcourses(
      {required String text}) async {
    try {
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.get(
        Courseshelper.searchMethod(text: text),
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      CoursesResponse model = CoursesResponse.fromJson(response.data);
      return Right(model); // Success case
    } on DioException catch (e) {
      print(e.toString());

      // String errorMessage = Dioerrorhelper.handleDioError(e);
      return Left(false); // Error case
    } catch (e) {
      return Left(false);
    }
  }

  Future<Either<bool, EnrollmentResponse>> Enrollment(
      {required String id}) async {
    try {
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.post(
        Courseshelper.EnrollemnturlMethod(id: id),
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      EnrollmentResponse model = EnrollmentResponse.fromJson(response.data);
      return Right(model); // Success case
    } on DioException catch (e) {
      // String errorMessage = Dioerrorhelper.handleDioError(e);
      print(e.toString());

      return Left(false); // Error case
    } catch (e) {
      return Left(false);
    }
  }

  Future<Either<bool, CourseWithProgressResponse>> Getcoursewithprogress(
      {required String id}) async {
    try {
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.get(
        Courseshelper.GetProgressCoursesMethod(id: id),
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      CourseWithProgressResponse model =
          CourseWithProgressResponse.fromJson(response.data);
      return Right(model); // Success case
    } on DioException catch (e) {
      print(e.toString());
      // String errorMessage = Dioerrorhelper.handleDioError(e);

      return Left(false); // Error case
    } catch (e) {
      print(e.toString());
      return Left(false);
    }
  }

  Future<Either<bool, bool>> markvideoAsWatched(
      {required String courseID, required String videoId}) async {
    try {
      String token = await SharedPreferencesDemo.getToken() ?? "";
      var response = await dio.post(
        Courseshelper.markvideoAsWatched,
        data: {"courseId": courseID, "videoId": videoId},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );
      print(
          "==========================================================================================================================================");
      print(response.data);
      return Right(true);
    } on DioException catch (e) {
      print(e.toString());
      print(
          "==========================================================================================================================================");

      return Left(false); // Error case
    } catch (e) {
      print(
          "==========================================================================================================================================");

      print(e.toString());
      return Left(false);
    }
  }
}
