import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/helper.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/Custom_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/QuestionCard.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/customappBarforQuestionpage.dart';
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
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.pen,
                    size: 14,
                  )
                ],
              ),
              SizedBox(
                height: 20,
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
                  borderRadius: 14,
                  onTap: () {
                    if (key.currentState!.validate()) {
                      Helper.showSuccessDialog(context);
                      Future.delayed(Duration(seconds: 5), () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
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
