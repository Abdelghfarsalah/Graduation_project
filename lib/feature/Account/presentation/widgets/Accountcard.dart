import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';

class Accountcard extends StatelessWidget {
  const Accountcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * 0.15,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.3,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffB8B8D2).withOpacity(0.2),
                        blurRadius: 12.r,
                        spreadRadius: 0,
                        offset: Offset(2, 2))
                  ],
                  borderRadius: BorderRadius.circular(33)),
            ),
            Positioned(
              top: -50.h,
              child: CircleAvatar(
                radius: 64.r,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundImage: AssetImage("assets/HomeImage/image 170.png"),
                ),
              ),
            ),
            Positioned(
              top: 70.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  FutureBuilder<String>(
                    future: getUserName(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // أو Placeholder
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        return Text(
                          snapshot.data!,
                          style: TextStyle(
                            fontFamily: appFonts.Poppins,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      } else {
                        return Text("No name available");
                      }
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "Passionate UI Designer dedicated to creating intuitive,  focused on delivering user-centered solutions and creative designs inspiring digital experiences.",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: appFonts.Poppins,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 45.h,
                          width: MediaQuery.of(context).size.width * 0.55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff5FA5FF),
                                    Color(0xff9CC7FF),
                                  ])),
                          child: Center(
                            child: Text(
                              "Complete your Profile",
                              style: TextStyle(
                                  fontFamily: appFonts.Poppins,
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            color: Color(0xff9CC7FF).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.paperPlane,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<String> getUserName() async {
  var x = await SharedPreferencesDemo.getUserName(); // مثال للتأخير
  return x;
}
