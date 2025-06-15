import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/chat/presentation/pages/chatpage.dart';
import 'package:graduation_project/feature/chat/presentation/pages/welcomepage.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/recommendchatPage.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/IMG_٢٠٢٥٠٢٢٢_١٩٥٧٣٣.jpg"),
                ),
                color: Colors.white,
              ),
              child: Row(
                children: [],
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: FutureBuilder<String>(
                  future: SharedPreferencesDemo
                      .getUserName(), // تستدعي القيم المحفوظة
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        "Loading Name ...",
                        style: TextStyle(
                          fontFamily: appFonts.Poppins,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ); // عرض مؤشر تحميل أثناء جلب البيانات
                    } else if (snapshot.hasError) {
                      return Text(
                          "ERROR WHEN LOADING NAME"); // التعامل مع الأخطاء
                    } else {
                      return Text(
                        "Welcome, ${snapshot.data}",
                        style: TextStyle(
                          fontFamily: appFonts.Poppins,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      );
                    }
                  },
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
              child: Text(
                "You can now use and explore all our services for free and permanently.",
                style: TextStyle(
                  fontFamily: appFonts.Poppins,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[500],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Divider(color: Colors.grey[300], height: 1),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Our AI services :",
                  style: TextStyle(
                    fontFamily: appFonts.Poppins,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            ListTile(
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: appColor.Primarycolor,
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/Icons/logo.png"),
                ),
              ),
              title: Text(
                "AI Agent",
                style: TextStyle(
                  fontFamily: appFonts.Poppins,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "You can use this tool to create a learning map based on your desires.",
                style: TextStyle(
                  fontFamily: appFonts.Poppins,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[500],
                ),
              ),
              onTap: () {
                Animationsforpages.navigateWithSlidepush(
                    context,
                    Recommendchatpage(
                      text: '',
                    ));
              },
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/Bot/Logo.png"),
                ),
              ),
              title: Text(
                "Smart Chat",
                style: TextStyle(
                  fontFamily: appFonts.Poppins,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "Your AI companion for instant, intelligent conversations.",
                style: TextStyle(
                  fontFamily: appFonts.Poppins,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[500],
                ),
              ),
              onTap: () async {
                bool dontshowwelcomepage = await SharedPreferencesDemo
                        .GetDontshowwelcomepageForChatBot() ??
                    false;
                if (dontshowwelcomepage) {
                  Animationsforpages.navigateWithSlidepush(context, Chatpage());
                  ;
                } else {
                  Animationsforpages.navigateWithSlidepush(
                      context, WelcomepageChabot());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
