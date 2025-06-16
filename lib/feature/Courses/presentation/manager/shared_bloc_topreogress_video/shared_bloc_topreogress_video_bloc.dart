import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/data/repoimplemts/CoursesrepoImple.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/shared_bloc_topreogress_video/shared_bloc_topreogress_video_event.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/shared_bloc_topreogress_video/shared_bloc_topreogress_video_state.dart';

class VideoProgressBloc extends Bloc<VideoProgressEvent, VideoProgressState> {
  final Coursesrepoimple repo;

  VideoProgressBloc(this.repo) : super(VideoProgressInitial()) {
    on<VideoThresholdReached>((event, emit) async {
      // await repo.markVideoAsWatched(event.courseId, event.videoId);
      // emit(VideoProgressReachedState(
      //   courseId: event.courseId,
      //   videoId: event.videoId,
      // ));
    });
  }
}
