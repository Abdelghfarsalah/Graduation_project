import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

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
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage("assets/HomeImage/image 170.png"),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Rahaf ",
                    style: TextStyle(
                        fontFamily: appFonts.Poppins,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    "Let’s start learning ",
                    style: TextStyle(
                        fontFamily: appFonts.Poppins,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: appColor.Primarycolor,
                    child: Center(
                      child: Image.asset("assets/HomeImage/Notification.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
