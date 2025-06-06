import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/failuers/accountdeletefailuer.dart';
import 'package:graduation_project/feature/Account/data/dataSources/datasourecs.dart';
import 'package:graduation_project/feature/Account/data/models/updateUserdata.dart';
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

  @override
  Future<Either<bool, Updateuserdata>> updateUseravatar(File imageFile) async {
    var reponse = await data.updateUseravatar(imageFile);
    return reponse.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      return right(ifRight);
    });
  }

  @override
  Future<Either<bool, String>> updateUserName(String username) async {
    var reponse = await data.updateUserName(username);
    return reponse.fold((ifLeft) {
      return left(ifLeft);
    }, (ifRight) {
      return right(ifRight);
    });
  }
}
