import 'package:dartz/dartz.dart';
import 'package:graduation_project/feature/Courses/data/Api/coursesDataSources.dart';
import 'package:graduation_project/feature/Courses/domain/models/CourseWithProgressResponse.dart';
import 'package:graduation_project/feature/Courses/domain/models/CoursesResponse.dart';
import 'package:graduation_project/feature/Courses/domain/models/Enrollmentmodel.dart';
import 'package:graduation_project/feature/Courses/domain/models/UserCoursesMode.dart';
import 'package:graduation_project/feature/Courses/domain/repo/coursesrepo.dart';

class Coursesrepoimple implements Coursesrepo {
  final Coursesdatasources coursesdatasources;
  const Coursesrepoimple({required this.coursesdatasources});
  @override
  Future<Either<bool, CoursesResponse>> GetAllCourses() async {
    var resonse = await coursesdatasources.GetAllCourses();
    return resonse.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      return right(ifRight);
    });
  }

  @override
  Future<Either<bool, CoursesResponse>> SearcForcourses(
      {required String text}) async {
    var resonse = await coursesdatasources.SearcForcourses(text: text);
    return resonse.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      return right(ifRight);
    });
  }

  @override
  Future<Either<bool, EnrollmentResponse>> Enrollment(
      {required String id}) async {
    var resonse = await coursesdatasources.Enrollment(id: id);
    return resonse.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      return right(ifRight);
    });
  }

  @override
  Future<Either<bool, CourseWithProgressResponse>> Getcoursewithprogress(
      {required String id}) async {
    var resonse = await coursesdatasources.Getcoursewithprogress(id: id);
    return resonse.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      return right(ifRight);
    });
  }

  @override
  Future<Either<bool, bool>> markvideoAsWatched(
      {required String courseID, required String videoId}) async {
    var resonse = await coursesdatasources.markvideoAsWatched(
        courseID: courseID, videoId: videoId);
    return resonse.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      return right(ifRight);
    });
  }

  @override
  Future<Either<bool, UserCoursesModel>> GetUserCourses() async {
    var resonse = await coursesdatasources.GetUserCourses();
    return resonse.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      return right(ifRight);
    });
  }
}
