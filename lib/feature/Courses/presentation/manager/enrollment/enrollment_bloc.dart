import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/domain/repo/coursesrepo.dart';

import 'enrollment_event.dart';
import 'enrollment_state.dart';

class EnrollmentBloc extends Bloc<EnrollmentEvent, EnrollmentState> {
  final Coursesrepo coursesrepo;
  EnrollmentBloc({required this.coursesrepo}) : super(EnrollmentInitial()) {
    on<EnrollCourse>(_EnrollCourse);
  }

  void _EnrollCourse(EnrollCourse event, Emitter<EnrollmentState> emit) async {
    emit(EnrollmentLoading());
    var response = await coursesrepo.Enrollment(id: event.id);
    response.fold((ifLeft) {
      emit(EnrollmentFailure());
    }, (ifRight) {
      emit(EnrollmentSuccess());
    });
  }
}
