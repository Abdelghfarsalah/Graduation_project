import 'package:graduation_project/feature/Courses/domain/models/CourseWithProgressResponse.dart';

abstract class GetoneCoursesBlocState {}

class InitoneGetCoursesState extends GetoneCoursesBlocState {}

class GetoneCoursesLoading extends GetoneCoursesBlocState {}

class GetoneCourseSuccess extends GetoneCoursesBlocState {
  final CourseWithProgressResponse cources;

  GetoneCourseSuccess({required this.cources});
}

class GetoneCoursesFailure extends GetoneCoursesBlocState {}
