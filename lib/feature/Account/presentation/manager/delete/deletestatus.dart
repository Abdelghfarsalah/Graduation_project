abstract class DeleteStatus {}

class DeleteInitial extends DeleteStatus {}

class DeleteLoading extends DeleteStatus {}

class DeleteSuccess extends DeleteStatus {}

class DeleteFailure extends DeleteStatus {
  final String error;

  DeleteFailure(this.error);
}
