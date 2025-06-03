abstract class EnrollmentState {}

class EnrollmentInitial extends EnrollmentState {}

class EnrollmentLoading extends EnrollmentState {}

class EnrollmentSuccess extends EnrollmentState {
  // final String message;

  // EnrollmentSuccess({this.message = "Enrollment successful!"});
}

class EnrollmentFailure extends EnrollmentState {
  // final String error;

  // EnrollmentFailure({required this.error});
}
