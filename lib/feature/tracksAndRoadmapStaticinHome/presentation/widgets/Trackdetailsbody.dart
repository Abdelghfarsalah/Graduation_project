import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/manager/get_track_by_id/get_track_by_id_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/manager/get_track_by_id/get_track_by_id_event.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/manager/get_track_by_id/get_track_by_id_state.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/TackDetailScreencontent.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/TrackDetailsLoading.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/TracksErrorWidget.dart';

class Trackdetailsbody extends StatefulWidget {
  const Trackdetailsbody({super.key, required this.id});
  final String id;
  @override
  State<Trackdetailsbody> createState() => _TrackdetailsbodyState();
}

class _TrackdetailsbodyState extends State<Trackdetailsbody> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetTrackByIDBloc>().add(getTrackByIDEvent(id: widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTrackByIDBloc, GetTrackByIDState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetTrackByIDSuccess) {
          return TrackDetailsScreen(
            trackData: state.data,
          );
        } else if (state is GetTrackByIDError) {
          return TracksErrorWidget();
        } else {
          return TrackDetailsLoading();
        }
      },
    );
  }
}
