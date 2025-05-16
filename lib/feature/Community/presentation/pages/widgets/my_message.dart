import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              radius: 18.r,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 17.r,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  msg.sender.avatar,
                ),
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
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   msg.sender.name,
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold, color: Colors.white),
                          // ),
                          // const SizedBox(height: 4),
                          Text(
                            msg.content,
                            style: TextStyle(color: Colors.white),
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
