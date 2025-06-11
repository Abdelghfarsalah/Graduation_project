import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/repoImplements/repoimplements.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/sources/StaticTracksDatasources.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/manager/tracks/tracks_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/Stataictrackspagebody.dart';

class Stataictrackspage extends StatelessWidget {
  const Stataictrackspage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TracksBloc(
        RepotracksImplement(
          datasources: Statictracksdatasources(
            dio: Dio(),
          ),
        ),
      ),
      child: Stataictrackspagebody(),
    );
  }
}
