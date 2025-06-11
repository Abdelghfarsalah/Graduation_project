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
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/tracksSearchField.dart';

class Stataictrackspagebody extends StatefulWidget {
  const Stataictrackspagebody({super.key});

  @override
  State<Stataictrackspagebody> createState() => _StataictrackspagebodyState();
}

class _StataictrackspagebodyState extends State<Stataictrackspagebody> {
  @override
  void initState() {
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
        title: 'Tracks',
      ),
      body: CustomScrollView(
        slivers: [
          /// Search Field (برا الـ Bloc)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BeautifulSearchField(),
            ),
          ),

          SliverToBoxAdapter(
            child: BlocConsumer<TracksBloc, TracksState>(
              listener: (context, state) {
                log(state.toString());
              },
              builder: (context, state) {
                if (state is TracksLoading) {
                  return DetailedLoadingShimmer();
                } else if (state is TracksSuccess) {
                  return Stataictrackspagebodycontent(data: state.data);
                } else {
                  return const TracksErrorWidget();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
