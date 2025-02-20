import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/failuers/loginFailuer.dart';
import 'package:graduation_project/feature/Authentication/data/apis/AuthDataSources.dart';
import 'package:graduation_project/feature/Authentication/data/models/Usermodel.dart';
import 'package:graduation_project/feature/Authentication/domain/Entity/userinfo.dart';
import 'package:graduation_project/feature/Authentication/domain/repo/Authrepo.dart';

class Authrepoimple implements Authrepo {
  final Authdatasources datasource;

  Authrepoimple({required this.datasource});
  @override
  Future<Either<Loginfailuer, LoginEntity>> login(
      {required String email, required String password}) async {
    var response = await datasource.login(email: email, password: password);

    return response.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      return right(ifRight.toDomain());
    });
  }
}
