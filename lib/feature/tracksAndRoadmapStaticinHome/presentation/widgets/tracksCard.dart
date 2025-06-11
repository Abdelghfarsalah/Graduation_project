import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/pages/TrackDetails.dart';
import 'package:shimmer/shimmer.dart';

class Trackscard extends StatelessWidget {
  const Trackscard(
      {super.key, required this.image, required this.title, required this.id});

  final String image;
  final String title;
  final String id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Animationsforpages.navigateWithSlidepushfromleft(
            context,
            Trackdetails(
              id: id,
            ));
      },
      child: Container(
        height: 250.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 12.r,
                  spreadRadius: 0,
                  color: Color(0xffB8B8D2).withOpacity(0.2))
            ]),
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.fill,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: appColor.Primarycolor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: appFonts.Poppins),
              ),
            )
          ],
        ),
      ),
    );
  }
}
