import 'package:dartz/dartz.dart';
import 'package:graduation_project/feature/recommendChat/data/models/addroadmapmodel.dart';
import 'package:graduation_project/feature/recommendChat/data/rescommendChatdatasources.dart';

class Roadmaprpo {
  final Rescommendchatdatasources datasources;

  Roadmaprpo({required this.datasources});
  Future<Either<bool, AddRoadmapModel>> AddRoadmapForLearning(
      Map<String, dynamic> roadmap) async {
    var response = await datasources.AddRoadmapForLearning(roadmap);
    return response.fold((ifLeft) {
      return left(false);
    }, (ifRight) {
      return right(ifRight);
    });
  }
}
