import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Account/domain/repos/repo.dart';
import 'package:graduation_project/feature/Account/presentation/manager/delete/deleteevent.dart';
import 'package:graduation_project/feature/Account/presentation/manager/delete/deletestatus.dart';

// تعريف الـ Bloc بشكل صحيح
class DeleteBloc extends Bloc<Deleteevent, DeleteStatus> {
  final accountrepo repo;

  DeleteBloc(this.repo) : super(DeleteInitial()) {
    on<delete>(_delete);
  }

  Future<void> _delete(delete event, Emitter<DeleteStatus> emit) async {
    emit(DeleteLoading());

    final result = await repo.delete();

    result.fold(
      (failure) => emit(DeleteFailure(failure.message)),
      (success) => emit(DeleteSuccess()),
    );
  }
}
