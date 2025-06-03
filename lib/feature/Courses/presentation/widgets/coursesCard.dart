import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/Courses/data/Api/coursesDataSources.dart';
import 'package:graduation_project/feature/Courses/data/repoimplemts/CoursesrepoImple.dart';
import 'package:graduation_project/feature/Courses/domain/models/CourseItem.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/enrollment/enrollment_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/CustomIconTogetCourse.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/changeStateEnrollButtonWhenEnrollSuccess.dart';

class CourseCard extends StatelessWidget {
  final CourseItem item;
  final String id;
  const CourseCard({
    super.key,
    required this.item,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
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
                    style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${item.totalDuration} min  ",
                        style:
                            TextStyle(fontSize: 14, color: Colors.grey[600])),
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
                    !item.isEnrollment
                        ? BlocProvider(
                            create: (context) => EnrollmentBloc(
                              coursesrepo: Coursesrepoimple(
                                coursesdatasources: Coursesdatasources(
                                  dio: Dio(),
                                ),
                              ),
                            ),
                            child: Changestateenrollbuttonwhenenrollsuccess(
                              id: id,
                              title: item.title,
                            ),
                          )
                        : Customicontogetcourse(
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
    );
  }
}
