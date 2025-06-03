import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/ApiHelper/coursesHelper.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Courses/domain/models/CourseWithProgressResponse.dart';
import 'package:graduation_project/feature/Courses/domain/models/CoursesResponse.dart';
import 'package:graduation_project/feature/Courses/domain/models/Enrollmentmodel.dart';

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
      // String errorMessage = Dioerrorhelper.handleDioError(e);

      return Left(false); // Error case
    } catch (e) {
      return Left(false);
    }
  }
}
