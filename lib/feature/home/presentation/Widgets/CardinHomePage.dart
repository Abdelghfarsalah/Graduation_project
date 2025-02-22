import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cardinhomepage extends StatelessWidget {
  const Cardinhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/HomeImage/HomeImage.png")),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 20.r,
              spreadRadius: 0,
              color: Color.fromARGB(184, 235, 236, 234))
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(33),
        ),
      ),
    );
  }
}
