import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/failuers/accountdeletefailuer.dart';
import 'package:graduation_project/feature/Account/data/models/updateUserdata.dart';

abstract class accountrepo {
  Future<Either<Accountdeletefailuer, bool>> delete();
  Future<Either<bool, Updateuserdata>> updateUseravatar(File imageFile);
}
