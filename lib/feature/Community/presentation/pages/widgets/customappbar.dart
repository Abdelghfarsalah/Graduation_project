import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';

class CustomappbarforCoummunity extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomappbarforCoummunity({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF424242),
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      centerTitle: false, // عنوان على اليسار لأسلوب محادثة أكثر
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Smart Path - Community", // اسم عام للمجموعة
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
