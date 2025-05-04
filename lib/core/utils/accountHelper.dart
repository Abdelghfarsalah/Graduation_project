import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/feature/Account/presentation/manager/delete/deletebloc.dart';
import 'package:graduation_project/feature/Account/presentation/manager/delete/deleteevent.dart';
import 'package:graduation_project/feature/Account/presentation/manager/delete/deletestatus.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarBloc.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarEvent.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/WelcomePage.dart';
import 'package:shimmer/shimmer.dart';

class Accounthelper {
  static void showdialogfordelete(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Icon(
          FontAwesomeIcons.xmark,
          color: Colors.redAccent,
          size: 50,
        ),
        content: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.2,
          child: Column(
            children: [
              Text(
                "Are you sure?",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                  "Once you delete the computer you will lose all resources and access.",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 10,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 10.h,
              ),
              BlocConsumer<DeleteBloc, DeleteStatus>(
                listener: (context, state) {
                  if (state is DeleteFailure) {
                    Navigator.pop(context);
                  } else if (state is DeleteSuccess) {
                    Future.delayed(Duration(seconds: 0), () {
                      context
                          .read<Bottomnavbarbloc>()
                          .add(ChangeEvent(index: 0));
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()),
                          (predicate) => false);
                    });
                  }
                },
                builder: (context, state) {
                  if (state is DeleteLoading) {
                    return ShimmerButtons();
                  } else
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        deletebutton(
                          title: "Cancel",
                          color: Colors.grey,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        deletebutton(
                          title: "Delete",
                          color: Colors.redAccent,
                          onTap: () {
                            context.read<DeleteBloc>().add(delete());
                          },
                        )
                      ],
                    );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class deletebutton extends StatelessWidget {
  const deletebutton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.color});
  final void Function() onTap;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        height: 45.h,
        width: 100.w,
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}

class ShimmerButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        shimmerBox(),
      ],
    );
  }

  Widget shimmerBox() {
    return Shimmer.fromColors(
      baseColor: Colors.red.shade300, // اللون الأساسي الأحمر
      highlightColor: Colors.red.shade100, // لمعة الشيمر
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.red.shade300, // لون الحاوية الأساسي (ضروري للشيمر)
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
