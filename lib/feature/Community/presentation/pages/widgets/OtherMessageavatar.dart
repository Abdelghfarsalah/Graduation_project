import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/communityHelper.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';

class Othermessageavatar extends StatelessWidget {
  const Othermessageavatar({super.key, required this.msg});
  final MessageModel msg;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Communityhelper.showdialogDisplayimageProfile(context, msg);
      },
      child: CircleAvatar(
        radius: 18.r,
        backgroundColor: Colors.white,
        backgroundImage: CachedNetworkImageProvider(
          msg.sender.avatar,
        ),
      ),
    );
  }
}
