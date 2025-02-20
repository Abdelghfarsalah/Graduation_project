import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/failuers/loginFailuer.dart';
import 'package:graduation_project/feature/Authentication/domain/Entity/userinfo.dart';

abstract class Authrepo {
  Future<Either<Loginfailuer, LoginEntity>> login({
    required String email,
    required String password,
  });
}
