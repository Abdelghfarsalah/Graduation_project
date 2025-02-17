import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/Verify_Phone_NumberCode.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/Custom_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/VerificationphoneTextFiled.dart';

class Verificationphoneactivites extends StatefulWidget {
  const Verificationphoneactivites({super.key});

  @override
  State<Verificationphoneactivites> createState() =>
      _VerificationphoneactivitesState();
}

class _VerificationphoneactivitesState
    extends State<Verificationphoneactivites> {
  String phone = "";

  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
          child: Column(
            children: [
              Form(
                key: key,
                child: Verificationphonetextfiled(
                  onChanged: (data) {
                    phone = data;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                borderRadius: 14,
                onTap: () {
                  if (key.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyPhoneNumbercode(
                          phone: phone,
                        ),
                      ),
                    );
                  }
                },
                endcolor: Color(0xff9CC7FF),
                color: Color(0xff5FA5FF),
                width: MediaQuery.of(context).size.width,
                text: 'Verification',
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                borderRadius: 14,
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Verificationphone()));
                },
                endcolor: Color(0xffC0DCFF),
                color: Color(0xffC0DCFF),
                width: MediaQuery.of(context).size.width,
                text: 'Later',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Image.asset(
                "assets/Icons/Businessman working on laptop.png",
                fit: BoxFit.none,
                height: 90,
                width: 90,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
