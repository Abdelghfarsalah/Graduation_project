import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_bloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_event.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Custom_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Timing.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/otp.dart';
import 'package:timer_count_down/timer_controller.dart';

class OtpcodeContainer extends StatefulWidget {
  const OtpcodeContainer({super.key, required this.phone});
  final String phone;

  @override
  State<OtpcodeContainer> createState() => _OtpcodeContainerState();
}

class _OtpcodeContainerState extends State<OtpcodeContainer> {
  CountdownController controller = CountdownController(autoStart: true);

  GlobalKey<FormState> Formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Expanded(
            child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.7,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
        )),
        Positioned(
          top: -100.h,
          left: 20.w,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.6,
            decoration: BoxDecoration(
              color: Color(0xffF7F8FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
                bottomLeft: Radius.circular(40.r),
                bottomRight: Radius.circular(40.r),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Verify Phone Number",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: appFonts.Poppins,
                      fontSize: 22.sp),
                ),
                Text(
                  "We Have Sent Code To Your Phone Number",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xffACADB9),
                      fontFamily: appFonts.Poppins,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                Text(
                  widget.phone,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xffACADB9),
                      fontFamily: appFonts.Poppins,
                      fontSize: 14.sp),
                ),
                Otp(
                  Formkey: Formkey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Timing(
                        controller: controller,
                      )),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomButton(
                    borderRadius: 40.r,
                    onTap: () {
                      context.read<RegisterBloc>().add(VerifyEmailEvent(
                          email: '', otp: context.read<RegisterBloc>().otp));
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Questionspage(),
                      //   ),
                      // );
                    },
                    endcolor: Color(0xff9CC7FF),
                    color: Color(0xff5FA5FF),
                    width: MediaQuery.of(context).size.width,
                    text: 'Verify',
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomButton(
                    borderRadius: 40,
                    onTap: () {
                      if (controller.isCompleted!) {
                        controller.restart();
                      }
                    },
                    endcolor: Color(0xffC0DCFF),
                    color: Color(0xffC0DCFF),
                    width: MediaQuery.of(context).size.width,
                    text: 'Send Again',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
