import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

class Searchinpopulartracks extends StatelessWidget {
  const Searchinpopulartracks({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
        child: TextField(
          cursorColor: appColor.Primarycolor,
          decoration: InputDecoration(
            hintText: "  Search for",
            hintStyle: TextStyle(
              color: Color(0xffB4BDC4),
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            fillColor: Colors.white,
            suffixIcon: Image(
              image: AssetImage(
                "assets/Icons/Group 11738.png",
              ),
              fit: BoxFit.none,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50), // تعيين نصف القطر
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(50), // نفس نصف القطر عند عدم التركيز
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(50), // نفس نصف القطر عند التركيز
              borderSide: BorderSide(color: appColor.Primarycolor, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
