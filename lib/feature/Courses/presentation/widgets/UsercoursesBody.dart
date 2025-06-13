import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_user_courses/get_user_courses_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_user_courses/get_user_courses_event.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_user_courses/get_user_courses_state.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/DisplayUserCourses.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/coursesShimmerloading.dart';

class Usercoursesbody extends StatefulWidget {
  const Usercoursesbody({super.key});

  @override
  State<Usercoursesbody> createState() => _UsercoursesbodyState();
}

class _UsercoursesbodyState extends State<Usercoursesbody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetUserCoursesBloc>().add(GetUserCourses());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserCoursesBloc, GetUserCoursesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetUserCoursesSuccess) {
          return Displayusercourses(
            coursesResponse: state.userCourses,
            title: 'Keep learning and exploring everything new in your courses',
          );
        } else {
          return LightShimmerLoading();
        }
      },
    );
  }
}
