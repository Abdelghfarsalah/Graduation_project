import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

class Searchpagetextfiled extends StatelessWidget {
  const Searchpagetextfiled({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
        child: Center(
            child: TextFormField(
          onChanged: (data) {},
          validator: (data) {
            return null;
          },
          cursorColor: appColor.Primarycolor,
          style: TextStyle(
              color: Colors.white,
              fontFamily: appFonts.Poppins,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            // hintText: "Design",
            prefixIcon: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    Text(
                      "Design",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: appFonts.Poppins),
                    ),
                    VerticalDivider(
                      width: 1,
                      color: Colors.white,
                    )
                  ],
                )),
            filled: true,
            hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: appFonts.Poppins),
            fillColor: Colors.blue,
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
