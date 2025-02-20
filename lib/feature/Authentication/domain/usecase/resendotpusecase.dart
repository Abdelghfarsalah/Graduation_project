import 'package:dartz/dartz.dart';
import 'package:graduation_project/feature/Authentication/data/models/resendOtpmodel.dart';
import 'package:graduation_project/feature/Authentication/domain/repo/Authrepo.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_state.dart';

class Resendotpusecase {
  final Authrepo repo;

  Resendotpusecase({required this.repo});
  Future<Either<RegisterFailure, ResendOtpModel>> resendotp({
    required String email,
  }) async {
    var response = await repo.resendotp(email: email);
    return response.fold((ifLeft) => left(ifLeft), (ifRight) => right(ifRight));
  }
}
