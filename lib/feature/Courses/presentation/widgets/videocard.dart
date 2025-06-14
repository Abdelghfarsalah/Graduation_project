import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/Courses/domain/models/Videomodel.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/mark_video_aswatched/mark_video_aswatched_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/mark_video_aswatched/mark_video_aswatched_event.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/mark_video_aswatched/mark_video_aswatched_state.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/videoplayer/videoplayer_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/videoplayer/videoplayer_event.dart';

class Videocard extends StatelessWidget {
  const Videocard({super.key, required this.video, required this.courseId});
  final Video video;
  final String courseId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<VideoplayerBloc>().add(playvideo(
            id: video.id,
            videoUrl: video.videoUrl,
            videoType: video.videoType,
            youtubeId: video.youtubeId));
        !video.watched
            ? context
                .read<MarkVideoAswatchedBloc>()
                .add(MarkvideoAsWatched(courseID: courseId, videoID: video.id))
            : null;
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<MarkVideoAswatchedBloc, MarkVideoAswatchedState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is MarkvideoasWatchedSuccess) {
                  return Icon(Icons.check_box, color: Colors.black, size: 22);
                } else {
                  return video.watched
                      ? Icon(Icons.check_box, color: Colors.black, size: 22)
                      : Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                        );
                }
              },
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.81,
                  child: Text(
                    "- ${video.title}",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.tv_rounded,
                      size: 18,
                    ),
                    Text(" ${video.duration} min"),
                    // Container(
                    //   width: 100.w,
                    //   height: 40.h,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(12),
                    //       border: Border.all(width: 2, color: Colors.black)),
                    // ),
                  ],
                ),
                // GestureDetector(
                //   onTap: () {},
                //   child: Text(
                //     "Watch Video",
                //     style: TextStyle(
                //       color: Colors.blueAccent,
                //       fontSize: 13.sp,
                //       decoration: TextDecoration.underline,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
