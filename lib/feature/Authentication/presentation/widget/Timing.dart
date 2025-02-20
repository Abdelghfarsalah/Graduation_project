import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Timing extends StatelessWidget {
  const Timing({super.key, required this.controller});
  final CountdownController controller;
  @override
  Widget build(BuildContext context) {
    return Countdown(
      controller: controller,
      seconds: 5,
      build: (BuildContext context, double time) => Text(
        "(${getTime(time)})",
        style: TextStyle(
            fontFamily: appFonts.Poppins,
            fontSize: 14,
            color: appColor.Primarycolor,
            fontWeight: FontWeight.w400),
      ),
      interval: Duration(milliseconds: 100),
      onFinished: () {
        print('Timer is done!');
      },
    );
  }
}

String getTime(double time) {
  return "${(time / 60).toInt()} : ${(time % 60).toInt()}";
}
