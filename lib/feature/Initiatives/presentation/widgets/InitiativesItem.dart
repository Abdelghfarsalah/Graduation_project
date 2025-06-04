import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';

class InitiativesItem extends StatelessWidget {
  const InitiativesItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onTap});
  final String image;
  final String title;
  final String subtitle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.fill)),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontFamily: appFonts.Poppins,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1F1F39)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    child: Text(
                      subtitle,
                      maxLines: 2,
                      style: TextStyle(
                          fontFamily: appFonts.Poppins,
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff828282)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
