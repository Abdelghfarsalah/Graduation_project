import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/communityHelper.dart';
import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';

class CustomappbarforCoummunity extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomappbarforCoummunity(
      {super.key, required this.scaffoldkey, required this.currentgroup});
  final GlobalKey<ScaffoldState> scaffoldkey;
  final Group currentgroup;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF0B1014),
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {
          // Open the drawer using the key
          scaffoldkey.currentState?.openDrawer();
        },
      ),
      centerTitle: false, // عنوان على اليسار لأسلوب محادثة أكثر
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              print(currentgroup.image);
              Communityhelper.showdialogDisplaycommunityIcon(
                  context, currentgroup.image, currentgroup.name);
            },
            child: CircleAvatar(
              radius: 19.r,
              backgroundColor: Colors.white,
              backgroundImage: CachedNetworkImageProvider(
                currentgroup.image,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentgroup.name.toUpperCase(), // اسم عام للمجموعة
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.w,
                    fontFamily: appFonts.Poppins),
              ),
              // Text(
              //   "4,412 Members", // اسم عام للمجموعة
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.w400,
              //       fontSize: 12.w,
              //       fontFamily: appFonts.Poppins),
              // ),
            ],
          ),
        ],
      ),
      iconTheme: IconThemeData(color: Colors.blue.shade300),
      actions: [
        Center(
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 50.h,
                color: Colors.white,
              )),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
