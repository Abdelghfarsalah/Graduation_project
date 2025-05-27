import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/helper.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Custom_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/QuestionCard.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/customappBarforQuestionpage.dart';
import 'package:graduation_project/feature/home/presentation/pages/home.dart';

class Questionspage extends StatefulWidget {
  const Questionspage({super.key});

  @override
  State<Questionspage> createState() => _QuestionspageState();
}

class _QuestionspageState extends State<Questionspage> {
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Customappbarforquestionpage(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Hello  ",
                    style: TextStyle(
                      fontFamily: appFonts.Poppins,
                      fontSize: 16.sp,
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.pen,
                    size: 14.sp,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Form(
                key: key,
                child: Column(
                  children: [
                    Questioncard(
                        q: "Are you a Computer Science student?",
                        hint: "Answer",
                        onChanged: (data) {},
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "this is required";
                          }
                          return null;
                        }),
                    Questioncard(
                        q: "Have you chosen your track yet?",
                        hint: "Answer",
                        onChanged: (data) {},
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "this is required";
                          }
                          return null;
                        }),
                    Questioncard(
                        q: "Is it possible to skip selecting a track?",
                        hint: "Answer",
                        onChanged: (data) {},
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "this is required";
                          }
                          return null;
                        }),
                    Questioncard(
                        q: "What inspired you to study CS?",
                        hint: "Answer",
                        onChanged: (data) {},
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "this is required";
                          }
                          return null;
                        }),
                    Questioncard(
                        keyboardType: TextInputType.number,
                        q: "How old are you?",
                        hint: "Answer",
                        onChanged: (data) {},
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "this is required";
                          }
                          return null;
                        }),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: CustomButton(
                  borderRadius: 14.r,
                  onTap: () {
                    if (key.currentState!.validate()) {
                      Helper.showSuccessDialog(context);
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (Route<dynamic> route) => false,
                        );
                      });
                    }
                  },
                  endcolor: Color(0xff9CC7FF),
                  color: Color(0xff5FA5FF),
                  width: MediaQuery.of(context).size.width,
                  text: 'Next',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
