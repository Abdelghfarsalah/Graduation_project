import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/manager/tracks/tracks_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/manager/tracks/tracks_event.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/manager/tracks/tracks_state.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/LoadingGridShimmerForTracks.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/StataictrackspagebodyContent.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/StaticTracksAppbar.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/TracksErrorWidget.dart';

class Stataictrackspagebody extends StatefulWidget {
  const Stataictrackspagebody({super.key});

  @override
  State<Stataictrackspagebody> createState() => _StataictrackspagebodyState();
}

class _StataictrackspagebodyState extends State<Stataictrackspagebody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TracksBloc>().add(GetAllTracksInHome());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarINTracks(
        title: 'Roadmaps',
      ),
      body: BlocConsumer<TracksBloc, TracksState>(
        listener: (context, state) {
          log(state.toString());
        },
        builder: (context, state) {
          if (state is TracksSuccess) {
            return Stataictrackspagebodycontent(
              data: state.data,
            );
          } else if (state is TracksLoading) {
            return DetailedLoadingShimmer();
          } else {
            return TracksErrorWidget();
          }
        },
      ),
    );
  }
}
