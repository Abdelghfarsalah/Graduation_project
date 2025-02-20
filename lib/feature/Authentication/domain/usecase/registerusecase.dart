import 'package:dartz/dartz.dart';
import 'package:graduation_project/feature/Authentication/domain/Entity/registerEntity.dart';
import 'package:graduation_project/feature/Authentication/domain/repo/Authrepo.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_state.dart';

class Registerusecase {
  final Authrepo authrepo;

  Registerusecase({required this.authrepo});

  Future<Either<RegisterFailure, RegisterEntity>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    var response =
        await authrepo.register(email: email, password: password, name: name);
    return response.fold((ifLeft) => left(ifLeft), (ifRight) => right(ifRight));
  }
}
