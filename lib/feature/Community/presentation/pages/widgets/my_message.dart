import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/communityHelper.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';

class MyMessage extends StatelessWidget {
  const MyMessage({super.key, required this.msg});
  final MessageModel msg;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 19.r,
              backgroundColor: Colors.white,
              backgroundImage: CachedNetworkImageProvider(
                msg.sender.avatar,
              ),
            ),
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
                        border: Border.all(width: 1, color: Colors.white),
                        color: Color(0xffE3FFEA),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                child: Text(
                                  msg.sender.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: appFonts.Poppins),
                                ),
                              ),
                              Spacer(),
                              Text(
                                Communityhelper.formatDateTime(msg.createdAt),
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            msg.content,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: appFonts.Poppins),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (msg.image != null)
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                        bottomLeft: Radius.circular(20.r),
                      ),
                      child: Image.network(msg.image!, height: 150.h),
                    ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
