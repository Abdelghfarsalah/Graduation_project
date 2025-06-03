import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/domain/repo/coursesrepo.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/course_progress/course_progress_state.dart';

import 'course_progress_event.dart';

class CourseProgressBloc
    extends Bloc<CourseProgressEvent, GetoneCoursesBlocState> {
  final Coursesrepo coursesrepo;
  CourseProgressBloc({required this.coursesrepo})
      : super(InitoneGetCoursesState()) {
    on<GetcourseById>(_GetcourseById);
  }

  void _GetcourseById(
      GetcourseById event, Emitter<GetoneCoursesBlocState> emit) async {
    emit(GetoneCoursesLoading());
    var response = await coursesrepo.Getcoursewithprogress(id: event.id);
    response.fold((ifLeft) {
      print(ifLeft);
      emit(GetoneCoursesFailure());
    }, (ifRight) {
      print(ifRight);
      emit(GetoneCourseSuccess(cources: ifRight));
    });
  }
}
