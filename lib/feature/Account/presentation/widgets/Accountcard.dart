import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/fonts.dart';

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
              height: 246,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffB8B8D2).withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 0,
                        offset: Offset(2, 2))
                  ],
                  borderRadius: BorderRadius.circular(33)),
            ),
            Positioned(
              top: -50,
              child: CircleAvatar(
                radius: 64,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/HomeImage/image 170.png"),
                ),
              ),
            ),
            Positioned(
              top: 70,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Rahaf Mohammad",
                    style: TextStyle(
                        fontFamily: appFonts.Poppins,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "Passionate UI Designer dedicated to creating intuitive,  focused on delivering user-centered solutions and creative designs inspiring digital experiences.",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: appFonts.Poppins,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 45,
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
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          width: 45,
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
