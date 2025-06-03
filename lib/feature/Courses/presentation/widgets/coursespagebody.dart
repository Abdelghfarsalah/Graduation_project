import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_couses_bloc/get_couses_bloc_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_couses_bloc/get_couses_bloc_event.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_couses_bloc/get_couses_bloc_state.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/courseappbar.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/coursesShimmerloading.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/customtextField.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/displayallcourses.dart';

class Coursespagebody extends StatefulWidget {
  const Coursespagebody({super.key});

  @override
  State<Coursespagebody> createState() => _CoursespagebodyState();
}

class _CoursespagebodyState extends State<Coursespagebody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getcources(context);
    });
  }

  Future<void> getcources(BuildContext context) async {
    if (!context.read<GetCousesBlocBloc>().loadcourses) {
      context.read<GetCousesBlocBloc>().add(GetCourses());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Courseappbar(
        title: 'Courses',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextFieldSearch(hintText: 'Explore Courses'),
            const SizedBox(height: 24),
            Expanded(
              child: BlocConsumer<GetCousesBlocBloc, GetCoursesBlocState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is GetCoursesSuccess) {
                    return Displayallcourses(
                      coursesResponse: state.cources,
                    );
                  } else {
                    return LightShimmerLoading();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
