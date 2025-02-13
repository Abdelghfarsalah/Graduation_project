import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Register/presentation/pages/VerificationPhone.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Custom_button.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Email.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Full_name.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Password.dart';

class FormAndButtonRegister extends StatefulWidget {
  const FormAndButtonRegister({super.key});

  @override
  State<FormAndButtonRegister> createState() => _FormAndButtonRegisterState();
}

class _FormAndButtonRegisterState extends State<FormAndButtonRegister> {
  GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
          key: key,
          child: Column(children: [
            FullName(onChanged: (data) {}),
            SizedBox(
              height: 20,
            ),
            EmailTextField(onChanged: (data) {}),
            SizedBox(
              height: 20,
            ),
            Password(onChanged: (data) {}),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              borderRadius: 14,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Verificationphone()));
              },
              endcolor: Color(0xff9CC7FF),
              color: Color(0xff5FA5FF),
              width: MediaQuery.of(context).size.width,
              text: 'Register',
            ),
          ])),
    );
  }
}
