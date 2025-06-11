import 'package:dartz/dartz.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/models/SingelTrackMode.dart';
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

  @override
  Future<Either<bool, TracksResponse>> SearchTracks(
      {required String name}) async {
    var response = await datasources.SearchTracks(name: name);
    return response.fold(
      (ifLeft) => left(ifLeft),
      (ifRight) => right(ifRight),
    );
  }

  @override
  Future<Either<bool, SingleTrackModel>> GetTrackByID(
      {required String id}) async {
    var response = await datasources.GetTrackByID(id: id);
    return response.fold(
      (ifLeft) => left(ifLeft),
      (ifRight) => right(ifRight),
    );
  }
}
