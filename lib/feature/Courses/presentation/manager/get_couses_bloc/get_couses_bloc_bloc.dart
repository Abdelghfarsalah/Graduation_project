import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/domain/repo/coursesrepo.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_couses_bloc/get_couses_bloc_state.dart';

import 'get_couses_bloc_event.dart';

class GetCousesBlocBloc extends Bloc<GetCousesBlocEvent, GetCoursesBlocState> {
  final Coursesrepo coursesrepo;
  GetCousesBlocBloc(this.coursesrepo) : super(InitGetCoursesState()) {
    on<GetCourses>(_GetCourses);
    on<SrearchforCourses>(_SrearchforCourses);
  }
  List<bool> isEnrollments = [];
  bool loadcourses = false;

  void _GetCourses(GetCourses event, Emitter<GetCoursesBlocState> emit) async {
    emit(GetCoursesLoading());
    var response = await coursesrepo.GetAllCourses();
    response.fold((ifLeft) {
      emit(GetCoursesFailure());
    }, (ifRight) {
      loadcourses = true;
      emit(GetCoursesSuccess(cources: ifRight));
    });
  }

  void _SrearchforCourses(
      SrearchforCourses event, Emitter<GetCoursesBlocState> emit) async {
    emit(GetCoursesLoading());
    var response = await coursesrepo.SearcForcourses(text: event.text);
    response.fold((ifLeft) {
      emit(GetCoursesFailure());
    }, (ifRight) {
      loadcourses = true;
      emit(GetCoursesSuccess(cources: ifRight));
    });
  }
}
