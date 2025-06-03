abstract class EnrollmentEvent {}

class EnrollCourse extends EnrollmentEvent {
  final String id;

  EnrollCourse({required this.id});
}
