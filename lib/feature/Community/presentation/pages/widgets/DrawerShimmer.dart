import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Drawershimmer extends StatelessWidget {
  const Drawershimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        5,
        (index) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.white),
            title: Container(
              height: 10.h,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 5),
            ),
          ),
        ),
      ),
    );
  }
}
