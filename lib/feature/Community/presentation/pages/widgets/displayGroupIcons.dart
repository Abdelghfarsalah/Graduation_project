import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/core/utils/communityHelper.dart';
import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';
import 'package:graduation_project/feature/Community/presentation/manager/chnage_chat/chnage_chat_bloc.dart';
import 'package:graduation_project/feature/Community/presentation/manager/chnage_chat/chnage_chat_event.dart';

class Displaygroupicons extends StatelessWidget {
  const Displaygroupicons({super.key, required this.groupsResponse});
  final GroupsResponse groupsResponse;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        groupsResponse.data.groups.length,
        (index) {
          final group = groupsResponse.data.groups[index];
          return Column(
            children: [
              ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Communityhelper.showdialogDisplaycommunityIcon(
                        context,
                        groupsResponse.data.groups[index].image,
                        groupsResponse.data.groups[index].name);
                  },
                  child: CircleAvatar(
                    radius: 19.r,
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(
                      groupsResponse.data.groups[index].image,
                    ),
                  ),
                ),
                trailing: Icon(
                  FontAwesomeIcons.users,
                  color: Color(0xFF1C2933),
                ),
                title: Text(
                  group.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontFamily: 'Poppins', // أو الخط اللي بتستخدمه في المشروع
                  ),
                ),
                onTap: () {
                  SharedPreferencesDemo.saveGroupName(
                    group.name,
                  );
                  context
                      .read<ChnageChatBloc>()
                      .add(ChangeChatEvent(group: group));
                  // هنا تقدر تعمل التنقل أو الفتح بناءً على الجروب
                },
              ),
              Divider(
                thickness: 1,
                height: 1,
              )
            ],
          );
        },
      ),
    );
  }
}
