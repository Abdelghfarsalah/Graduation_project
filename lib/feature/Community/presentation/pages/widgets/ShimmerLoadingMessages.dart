import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingMessages extends StatelessWidget {
  const ShimmerLoadingMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(20, (index) {
        // final bool isEven = index % 2 == 0;

        final avatar = CircleAvatar(
          radius: 20.r,
          backgroundColor: Colors.white,
        );

        final messageBox = Expanded(
          child: Container(
            height: 70.h,
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(vertical: 4),
          ),
        );

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children:
                // ?
                [
              avatar,
              SizedBox(width: 12.w),
              messageBox,
            ]),
          ),
        );
      }),
    );
  }
}
