import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/communityHelper.dart';

class CustomappbarforCoummunity extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomappbarforCoummunity({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF0B1014),
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 50.h,
              color: Colors.white,
            )),
      ),
      centerTitle: false, // عنوان على اليسار لأسلوب محادثة أكثر
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Communityhelper.showdialogDisplaycommunityIcon(context,
                  'assets/IMG_٢٠٢٥٠٢٢٢_١٩٥٧٣٣.jpg', 'Smart Path Community');
            },
            child: CircleAvatar(
                radius: 19.r,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/IMG_٢٠٢٥٠٢٢٢_١٩٥٧٣٣.jpg')),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Community", // اسم عام للمجموعة
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.w,
                    fontFamily: appFonts.Poppins),
              ),
              Text(
                "4,412 Members", // اسم عام للمجموعة
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.w,
                    fontFamily: appFonts.Poppins),
              ),
            ],
          ),
        ],
      ),
      iconTheme: IconThemeData(color: Colors.blue.shade300),
      actions: [
        // IconButton(
        //   color: Colors.black,
        //   icon: Icon(Icons.search), // أيقونة بحث
        //   onPressed: () {
        //     // وظيفة البحث
        //   },
        // ),
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.more_vert), // أيقونة المزيد
          onPressed: () {
            // وظائف إضافية
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
