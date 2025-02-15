import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

class Trendingtrackspagetextfield extends StatelessWidget {
  const Trendingtrackspagetextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
        child: Center(
            child: TextFormField(
          onChanged: (data) {},
          validator: (data) {
            return null;
          },
          style: TextStyle(
              color: Color(0xff0050D0),
              fontFamily: appFonts.Poppins,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: "Search Track",
            suffixIcon: Image(image: AssetImage("assets/Icons/Vector.png")),
            filled: true,
            hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: appFonts.Poppins),
            fillColor: Colors.white,
            prefixIcon: Image(image: AssetImage("assets/Icons/Searchicon.png")),
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
        )),
      ),
    );
  }
}
