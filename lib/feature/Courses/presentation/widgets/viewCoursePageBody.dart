import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/domain/models/Section.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/videoplayer/videoplayer_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/videoplayer/videoplayer_state.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/VideoPlayerWidget.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/descriptionInCoursespages.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/displaySection.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/youtubeVideoPlayer.dart';

class Viewcoursepagebody extends StatelessWidget {
  const Viewcoursepagebody({
    super.key,
    required this.sections,
    required this.image,
    required this.Courseid,
    required this.Des,
  });

  final List<Section> sections;
  final String image;
  final String Courseid;
  final String Des;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: BlocConsumer<VideoplayerBloc, VideoplayerState>(
          listener: (context, state) {
            log("state changed: $state");
          },
          builder: (context, state) {
            log(state.toString());
            log("state.toString()");
            log(state.toString());
            if (state is PlayingVideoState) {
              if (state.videoType == "youtube") {
                return CustomYoutubePlayer(
                  videoUrl: state.videoUrl,
                  videoiId: state.youtubeId!,
                  courseId: Courseid,
                );
              } else {
                return VideoPlayerWidget(
                  videoUrl: state.videoUrl,
                  videoiId: state.id,
                  CourseId: Courseid,
                );
              }
            } else if (state is PlayingVideoloading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(image),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }
          },
        )),
        Descriptionincoursespages(
          dse: Des,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Displaysection(
              section: sections[index],
              index: index,
              courseId: Courseid,
            ),
            childCount: sections.length,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
          ),
        )
      ],
    );
  }
}
