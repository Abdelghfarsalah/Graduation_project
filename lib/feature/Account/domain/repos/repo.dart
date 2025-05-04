import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/failuers/accountdeletefailuer.dart';

abstract class accountrepo {
  Future<Either<Accountdeletefailuer, bool>> delete();
}
