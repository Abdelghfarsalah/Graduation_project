import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/chat/presentation/pages/chatpage.dart';
import 'package:graduation_project/feature/chat/presentation/pages/welcomepage.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/avatarImage.dart';

class Homeappbar extends StatelessWidget {
  const Homeappbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColor.Primarycolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, bottom: 90),
          child: Row(
            children: [
              Avatarimage(
                height: 25,
              ),
              // CircleAvatar(
              //   radius: 25,
              //   backgroundColor: Colors.white,
              //   child: CircleAvatar(
              //     radius: 23,
              //     backgroundImage: AssetImage("assets/HomeImage/image 170.png"),
              //   ),
              // ),
              SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: FutureBuilder<String>(
                      future: SharedPreferencesDemo
                          .getUserName(), // تستدعي القيم المحفوظة
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text(
                            "Loading Name ...",
                            style: TextStyle(
                              fontFamily: appFonts.Poppins,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ); // عرض مؤشر تحميل أثناء جلب البيانات
                        } else if (snapshot.hasError) {
                          return Text(
                              "خطأ في تحميل الاسم"); // التعامل مع الأخطاء
                        } else {
                          return Text(
                            snapshot.data ?? "اسم غير متوفر",
                            style: TextStyle(
                              fontFamily: appFonts.Poppins,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          );
                        }
                      },
                    ),
                  ),
                  Text(
                    "Let’s start learning ",
                    style: TextStyle(
                        fontFamily: appFonts.Poppins,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  bool dontshowwelcomepage = await SharedPreferencesDemo
                          .GetDontshowwelcomepageForChatBot() ??
                      false;
                  if (dontshowwelcomepage) {
                    Animationsforpages.navigateWithSlidepush(
                        context, Chatpage());
                    ;
                  } else {
                    Animationsforpages.navigateWithSlidepush(
                        context, WelcomepageChabot());
                  }
                },
                child: Container(
                  height: 38.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(8.r),
                    // color: Colors.black),
                  ),
                  child: Center(
                    child: Image.asset("assets/HomeImage/8943377.png",
                        height: 35.h, width: 35.w),
                  ),
                ),
              )
              // GestureDetector(
              //   onTap: () {
              //     scaffoldkey.currentState!.openEndDrawer();
              //     // Animationsforpages.navigateWithSlidepush(
              //     //     context,
              //     //     Recommendchatpage(
              //     //       text: '',
              //     //     ));
              //   },
              //   child: Icon(
              //     Icons.menu,
              //     color: Colors.white,
              //     size: 28,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
