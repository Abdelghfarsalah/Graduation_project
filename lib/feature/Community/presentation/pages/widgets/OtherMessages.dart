import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';

class Othermessage extends StatelessWidget {
  const Othermessage({super.key, required this.msg});
  final MessageModel msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.78,
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
                        color: const Color.fromARGB(255, 238, 238, 238),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                          bottomLeft: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            msg.sender.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            msg.content,
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 5.h,
                  ),
                  if (msg.image != null)
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                        bottomLeft: Radius.circular(20.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Image.network(msg.image!, height: 200.h),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            CircleAvatar(
              radius: 18.r,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 17.r,
                backgroundImage: NetworkImage(
                  msg.sender.avatar,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
