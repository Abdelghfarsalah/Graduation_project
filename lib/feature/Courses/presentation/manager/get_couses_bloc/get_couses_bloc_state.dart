import 'package:graduation_project/feature/Courses/domain/models/CoursesResponse.dart';

abstract class GetCoursesBlocState {}

class InitGetCoursesState extends GetCoursesBlocState {}

class GetCoursesLoading extends GetCoursesBlocState {}

class GetCoursesSuccess extends GetCoursesBlocState {
  final CoursesResponse cources;

  GetCoursesSuccess({required this.cources});
}

class GetCoursesFailure extends GetCoursesBlocState {}
