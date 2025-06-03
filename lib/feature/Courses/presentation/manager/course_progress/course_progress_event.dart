abstract class CourseProgressEvent {}

class GetcourseById extends CourseProgressEvent {
  final String id;

  GetcourseById({required this.id});
}
