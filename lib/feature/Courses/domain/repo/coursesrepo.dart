import 'package:dartz/dartz.dart';
import 'package:graduation_project/feature/Courses/domain/models/CourseWithProgressResponse.dart';
import 'package:graduation_project/feature/Courses/domain/models/CoursesResponse.dart';
import 'package:graduation_project/feature/Courses/domain/models/Enrollmentmodel.dart';
import 'package:graduation_project/feature/Courses/domain/models/UserCoursesMode.dart';

abstract class Coursesrepo {
  Future<Either<bool, CoursesResponse>> GetAllCourses();
  Future<Either<bool, CoursesResponse>> SearcForcourses({required String text});
  Future<Either<bool, EnrollmentResponse>> Enrollment({required String id});
  Future<Either<bool, CourseWithProgressResponse>> Getcoursewithprogress(
      {required String id});
  Future<Either<bool, bool>> markvideoAsWatched(
      {required String courseID, required String videoId});
  Future<Either<bool, UserCoursesModel>> GetUserCourses();
}
