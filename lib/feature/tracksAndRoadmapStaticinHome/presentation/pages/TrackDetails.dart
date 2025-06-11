import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/repoImplements/repoimplements.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/sources/StaticTracksDatasources.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/manager/get_track_by_id/get_track_by_id_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/Trackdetailsbody.dart';

class Trackdetails extends StatelessWidget {
  const Trackdetails({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTrackByIDBloc(
        RepotracksImplement(
          datasources: Statictracksdatasources(
            dio: Dio(),
          ),
        ),
      ),
      child: Trackdetailsbody(
        id: id,
      ),
    );
  }
}
