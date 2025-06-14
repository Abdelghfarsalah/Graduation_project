import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/Courses/data/Api/coursesDataSources.dart';
import 'package:graduation_project/feature/Courses/data/repoimplemts/CoursesrepoImple.dart';
import 'package:graduation_project/feature/Courses/domain/models/Section.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/mark_video_aswatched/mark_video_aswatched_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/videocard.dart';

class Displaysection extends StatefulWidget {
  const Displaysection({
    super.key,
    required this.section,
    required this.index,
    required this.courseId,
  });

  final Section section;
  final int index;
  final String courseId;
  @override
  State<Displaysection> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<Displaysection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // زر الفتح/الإغلاق
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            // padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2.h,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.section.title,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${widget.section.totalDuration} min | ${widget.section.videos.length} videos",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      AnimatedRotation(
                        turns: _isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(Icons.keyboard_arrow_down, size: 28),
                      )
                    ],
                  ),
                ),
                SizedBox()
              ],
            ),
          ),
        ),

        // المحتوى المفصل
        AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: _isExpanded
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      ...widget.section.videos.map((video) {
                        return BlocProvider(
                          create: (context) => MarkVideoAswatchedBloc(
                            Coursesrepoimple(
                              coursesdatasources:
                                  Coursesdatasources(dio: Dio()),
                            ),
                          ),
                          child: Videocard(
                            video: video,
                            courseId: widget.courseId,
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
