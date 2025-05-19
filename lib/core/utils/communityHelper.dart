import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';

class Communityhelper {
  static String formatDateTime(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate).toLocal();

    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');
    String hours = dateTime.hour.toString().padLeft(2, '0');
    String minutes = dateTime.minute.toString().padLeft(2, '0');

    return "$day/$month $hours:$minutes";
  }

  static void showdialogDisplayimageProfile(
      BuildContext context, MessageModel msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(0),
        content: Hero(
          tag: msg.sender.avatar,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: CachedNetworkImageProvider(
                  msg.sender.avatar,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FittedBox(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 50.h,
                    padding: EdgeInsets.all(15.h),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Text(
                      msg.sender.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: appFonts.Poppins),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void showdialogDisplaycommunityIcon(
      BuildContext context, String image, String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(0),
        content: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(image),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50.h,
                  padding: EdgeInsets.all(15.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: appFonts.Poppins),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
