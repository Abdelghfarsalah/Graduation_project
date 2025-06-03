abstract class GetCousesBlocEvent {}

class GetCourses extends GetCousesBlocEvent {}

class SrearchforCourses extends GetCousesBlocEvent {
  final String text;

  SrearchforCourses({required this.text});
}
