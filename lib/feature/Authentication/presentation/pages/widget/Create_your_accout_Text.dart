import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';

class CreateYourAccoutText extends StatelessWidget {
  const CreateYourAccoutText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: appFonts.Poppins),
          ),
        ),
      ),
    );
  }
}
