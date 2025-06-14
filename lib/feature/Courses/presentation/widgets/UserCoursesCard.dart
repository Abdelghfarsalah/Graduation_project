import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/Courses/domain/models/UserCoursesMode.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/course_progress/course_progress_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/course_progress/course_progress_event.dart';
import 'package:graduation_project/feature/Courses/presentation/pages/DisplaySpesificCourse.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/CustomIconTogetCourse.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/convertdataTimetohoure.dart';

class Usercoursescard extends StatelessWidget {
  final Course item;
  final String id;
  const Usercoursescard({
    super.key,
    required this.item,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CourseProgressBloc>().add(GetcourseById(id: id));
        Animationsforpages.navigateWithSlidepush(
            context,
            Displayspesificcourse(
              title: item.title,
            ));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 100.h,
                  width: 120.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: CachedNetworkImageProvider(item.image))),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(item.description,
                          maxLines: 3,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600])),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formateDatatime(item.totalDuration),
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600])),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${item.averageRating} ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Customicontogetcourse(
                            id: id,
                            title: item.title,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Divider(color: Colors.grey[300], height: 1),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
