import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/core/utils/communityHelper.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';
import 'package:graduation_project/feature/Community/presentation/pages/displayImage.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/customshareicon.dart';
import 'package:shimmer/shimmer.dart';

class MyMessage extends StatelessWidget {
  const MyMessage({super.key, required this.msg});
  final MessageModel msg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // GestureDetector(
          //   onTap: () {
          //     Communityhelper.showdialogDisplayimageProfile(context, msg);
          //   },
          //   child: CircleAvatar(
          //     radius: 19.r,
          //     backgroundColor: Colors.white,
          //     backgroundImage: CachedNetworkImageProvider(
          //       msg.sender.avatar,
          //     ),
          //   ),
          // ),
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    margin: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: BoxDecoration(
                      // border: Border.all(width: 1, color: Colors.white),
                      color: Color(0xff144D37),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          msg.content,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: appFonts.Poppins),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            Communityhelper.formatDateTime(msg.createdAt),
                            style: TextStyle(
                              color: Colors.grey[100],
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                if (msg.image != null)
                  GestureDetector(
                    onTap: () {
                      Animationsforpages.navigateWithSlidepushfromleft(
                          context, DisplayImage(imageUrl: msg.image!));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: msg.image!,
                        // height: 200.h,
                        width: double.infinity, // إذا حبيت تملي العرض
                        fit: BoxFit.cover, // علشان الصورة تبان بشكل مرتب
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            // height: 200.h,
                            width: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),

                // SizedBox(
                //   height: 5,
                // )
              ],
            ),
          ),
          Customshareicon(msg: msg),
        ],
      ),
    );
  }
}

class MessageTail extends CustomPainter {
  final Color color;
  MessageTail({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
