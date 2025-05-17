abstract class UpdateNameStatus {}

class UpdateNameInitial extends UpdateNameStatus {}

class UpdateNameLoading extends UpdateNameStatus {}

class UpdateNameSuccess extends UpdateNameStatus {}

class UpdateNameFailure extends UpdateNameStatus {
  final String error;

  UpdateNameFailure(this.error);
}
