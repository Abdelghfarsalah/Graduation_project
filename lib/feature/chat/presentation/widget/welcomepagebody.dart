import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/chat/presentation/pages/chatpage.dart';

class Welcomepagebody extends StatelessWidget {
  const Welcomepagebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset("assets/Bot/Logo.png"),
          SizedBox(
            height: 10,
          ),
          Text(
            " Welcome to ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w700,
                fontFamily: appFonts.Urbanist),
          ),
          Text(
            "SmartTalk",
            style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w700,
                fontFamily: appFonts.Urbanist),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Start chatting with ChattyAI now.",
            style: TextStyle(
                color: Color(0xff616161),
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: appFonts.Urbanist),
          ),
          Text(
            "You can ask me anything.",
            style: TextStyle(
                color: Color(0xff616161),
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: appFonts.Urbanist),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Chatpage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0); // من اليمين
                        const end = Offset.zero;
                        const curve = Curves.easeIn;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      }),
                );
              },
              child: Container(
                height: 63,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black),
                child: Center(
                    child: Text(
                  "Get started",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: appFonts.Poppins),
                )),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

/**
                    
                    MaterialPageRoute(builder: (context) => Chatpage()) */
