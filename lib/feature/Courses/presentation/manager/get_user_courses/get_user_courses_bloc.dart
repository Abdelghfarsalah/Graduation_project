import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/domain/repo/coursesrepo.dart';

import 'get_user_courses_event.dart';
import 'get_user_courses_state.dart';

class GetUserCoursesBloc
    extends Bloc<GetUserCoursesEvent, GetUserCoursesState> {
  final Coursesrepo coursesrepo;
  GetUserCoursesBloc(this.coursesrepo) : super(InitGetUserCoursesState()) {
    on<GetUserCourses>(_GetUserCourses);
  }

  void _GetUserCourses(
      GetUserCourses event, Emitter<GetUserCoursesState> emit) async {
    emit(GetUserCoursesLoading());
    var response = await coursesrepo.GetUserCourses();
    response.fold((ifLeft) {
      emit(GetUserCoursesFailure());
    }, (ifRight) {
      emit(GetUserCoursesSuccess(userCourses: ifRight));
    });
  }
}
