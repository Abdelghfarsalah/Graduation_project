import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/core/utils/communityHelper.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';
import 'package:graduation_project/feature/Community/presentation/pages/displayImage.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/OtherMessageavatar.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/Othermessageheader.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/customshareicon.dart';
import 'package:shimmer/shimmer.dart';

class Othermessage extends StatelessWidget {
  const Othermessage({super.key, required this.msg});
  final MessageModel msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Customshareicon(msg: msg.content),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (msg.content.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Color(0xff242626),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.r),
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Othermessageheader(
                            msg: msg,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            msg.content,
                            style: TextStyle(color: Colors.white),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
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
                  SizedBox(
                    height: 5.h,
                  ),
                  if (msg.image != null)
                    GestureDetector(
                      onTap: () {
                        Animationsforpages.navigateWithSlidepush(
                            context, DisplayImage(imageUrl: msg.image!));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: CachedNetworkImage(
                            imageUrl: msg.image!,
                            height: 250.h,
                            width: double
                                .infinity, // اختياري، لو حابب تمتد على عرض الشاشة
                            fit: BoxFit
                                .cover, // اختياري، حسب طريقة العرض اللي تحبها
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 200.h,
                                width: double.infinity,
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Align(
                heightFactor: 1.0,
                alignment: Alignment.topCenter,
                child: Othermessageavatar(
                  msg: msg,
                ))
          ],
        ),
      ),
    );
  }
}
