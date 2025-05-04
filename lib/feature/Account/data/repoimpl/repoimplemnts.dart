import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/failuers/accountdeletefailuer.dart';
import 'package:graduation_project/feature/Account/data/dataSources/datasourecs.dart';
import 'package:graduation_project/feature/Account/domain/repos/repo.dart';

class accountRepoimplemnts implements accountrepo {
  accountdatasources data;
  accountRepoimplemnts({required this.data});
  @override
  Future<Either<Accountdeletefailuer, bool>> delete() async {
    var reponse = await data.delete();
    return reponse.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      return right(ifRight);
    });
  }
}
