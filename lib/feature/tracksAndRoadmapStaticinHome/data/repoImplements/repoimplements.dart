import 'package:dartz/dartz.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/models/staticTrackmodels.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/sources/StaticTracksDatasources.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/domain/repo/repoTracks.dart';

class RepotracksImplement extends Repotracks {
  final Statictracksdatasources datasources;

  RepotracksImplement({required this.datasources});
  @override
  Future<Either<bool, TracksResponse>> GetAllTracks() async {
    var response = await datasources.GetAllTracks();
    return response.fold(
      (ifLeft) => left(ifLeft),
      (ifRight) => right(ifRight),
    );
  }
}
