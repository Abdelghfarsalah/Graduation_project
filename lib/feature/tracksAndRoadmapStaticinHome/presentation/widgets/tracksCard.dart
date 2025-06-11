import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

class Trackscard extends StatelessWidget {
  const Trackscard(
      {super.key, required this.image, required this.title, required this.id});

  final String image;
  final String title;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.fill,
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
    );
  }
}
