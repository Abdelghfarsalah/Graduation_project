import 'package:graduation_project/feature/Courses/domain/models/UserCoursesMode.dart';

abstract class GetUserCoursesState {}

class InitGetUserCoursesState extends GetUserCoursesState {}

class GetUserCoursesLoading extends GetUserCoursesState {}

class GetUserCoursesSuccess extends GetUserCoursesState {
  final UserCoursesModel userCourses;

  GetUserCoursesSuccess({required this.userCourses});
}

class GetUserCoursesFailure extends GetUserCoursesState {}
