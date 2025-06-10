import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/data/api/UserpreogreaaRoadmap.dart';

import 'competeitem_event.dart';
import 'competeitem_state.dart';

class CompleteItemBloc extends Bloc<CompeteitemEvent, CompleteItemState> {
  final Userpreogreaaroadmap data;
  CompleteItemBloc(this.data) : super(CompleteItemInit()) {
    on<MarkItemAsCompleted>(_MarkItemAsCompleted);
  }
  void _MarkItemAsCompleted(
      MarkItemAsCompleted event, Emitter<CompleteItemState> emit) async {
    emit(CompleteItemLoading());
    try {
      var response = await data.completeitem(
        stepNumber: event.stepNumber,
        categoryTitle: event.categoryTitle,
        itemTitle: event.itemTitle,
      );
      response.fold((ifLeft) {
        emit(CompleteItemFailure());
      }, (ifRight) {
        emit(CompleteItemSuccess(ifRight, event.itemTitle));
      });
    } catch (e) {
      emit(CompleteItemFailure());
    }
  }
}
