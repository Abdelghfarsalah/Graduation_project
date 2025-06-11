import 'package:dartz/dartz.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/models/SingelTrackMode.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/models/staticTrackmodels.dart';

abstract class Repotracks {
  Future<Either<bool, TracksResponse>> GetAllTracks();
  Future<Either<bool, TracksResponse>> SearchTracks({required String name});
  Future<Either<bool, SingleTrackModel>> GetTrackByID({required String id});
}
