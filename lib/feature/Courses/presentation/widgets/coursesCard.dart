import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/Courses/data/Api/coursesDataSources.dart';
import 'package:graduation_project/feature/Courses/data/repoimplemts/CoursesrepoImple.dart';
import 'package:graduation_project/feature/Courses/domain/models/CourseItem.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/course_progress/course_progress_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/course_progress/course_progress_event.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/enrollment/enrollment_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_couses_bloc/get_couses_bloc_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/pages/DisplaySpesificCourse.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/CustomIconTogetCourse.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/changeStateEnrollButtonWhenEnrollSuccess.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/convertdataTimetohoure.dart';

class CourseCard extends StatelessWidget {
  final CourseItem item;
  final String id;
  final int index;
  const CourseCard({
    super.key,
    required this.item,
    required this.id,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.read<GetCousesBlocBloc>().isEnrollments[index]) {
          context.read<CourseProgressBloc>().add(GetcourseById(id: id));
          Animationsforpages.navigateWithSlidepush(
              context,
              Displayspesificcourse(
                title: item.title,
              ));
        } else {
          Fluttertoast.showToast(
            msg: "Enroll before you start learning",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: const Color(0xFF008060), // soft green
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
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
                      Html(
                        data: item.description,
                        style: {
                          "body": Style(
                            fontSize: FontSize(14.0),
                            color: Colors.grey[600],
                            maxLines: 3,
                            textOverflow: TextOverflow.ellipsis,
                            margin: Margins(), // لتقليل الفراغات الجانبية
                            padding: HtmlPaddings(),
                          ),
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formateDatatime(item.totalDuration),
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
                          !item.isEnrollment
                              ? BlocProvider(
                                  create: (context) => EnrollmentBloc(
                                    coursesrepo: Coursesrepoimple(
                                      coursesdatasources: Coursesdatasources(
                                        dio: Dio(),
                                      ),
                                    ),
                                  ),
                                  child:
                                      Changestateenrollbuttonwhenenrollsuccess(
                                    id: id,
                                    index: index,
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
            SizedBox(height: 5.h),
            Divider(color: Colors.grey[300], height: 1),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
