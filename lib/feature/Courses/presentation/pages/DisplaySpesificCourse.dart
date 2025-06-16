import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/data/Api/coursesDataSources.dart';
import 'package:graduation_project/feature/Courses/data/repoimplemts/CoursesrepoImple.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/course_progress/course_progress_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/course_progress/course_progress_state.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/mark_video_aswatched/mark_video_aswatched_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/videoplayer/videoplayer_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/viewCoursePageBody.dart';

class Displayspesificcourse extends StatelessWidget {
  const Displayspesificcourse({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: BlocConsumer<CourseProgressBloc, GetoneCoursesBlocState>(
        listener: (context, state) {
          if (state is GetoneCourseSuccess) {
            final Map<String, bool> watchedMap = {};

            for (final section in state.cources.data.course.sections) {
              for (final video in section.videos) {
                watchedMap[video.id] = video.watched;
              }
            }
            context.read<CourseProgressBloc>().watchedMap.addAll(watchedMap);
            // طباعة الخريطة بالكامل
            print("watchedMap: $watchedMap");

            // مثال: طباعة حالة فيديو معين
            final vid =
                state.cources.data.course.sections.first.videos.first.id;
            print("video $vid watched: ${watchedMap[vid]}");
          }
        },
        builder: (context, state) {
          if (state is GetoneCourseSuccess) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<VideoplayerBloc>(
                  create: (context) => VideoplayerBloc(
                    Coursesrepoimple(
                      coursesdatasources: Coursesdatasources(dio: Dio()),
                    ),
                  ),
                ),
                BlocProvider<MarkVideoAswatchedBloc>(
                  create: (context) => MarkVideoAswatchedBloc(
                    Coursesrepoimple(
                      coursesdatasources: Coursesdatasources(dio: Dio()),
                    ),
                  ),
                ),
              ],
              child: Viewcoursepagebody(
                sections: state.cources.data.course.sections,
                image: state.cources.data.course.image,
                Courseid: state.cources.data.course.id,
                Des: state.cources.data.course.description,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
