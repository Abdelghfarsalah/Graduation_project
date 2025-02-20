import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_bloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_event.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Custom_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Email.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Full_name.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Password.dart';

class FormAndButtonRegister extends StatefulWidget {
  const FormAndButtonRegister({super.key});

  @override
  State<FormAndButtonRegister> createState() => _FormAndButtonRegisterState();
}

class _FormAndButtonRegisterState extends State<FormAndButtonRegister> {
  GlobalKey<FormState> key = GlobalKey();
  String email = "";
  String pass = "";
  String fullname = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
          key: key,
          child: Column(children: [
            FullName(onChanged: (data) {
              fullname = data;
            }),
            SizedBox(
              height: 20,
            ),
            EmailTextField(onChanged: (data) {
              context.read<RegisterBloc>().Email = data;
              email = data;
            }),
            SizedBox(
              height: 20,
            ),
            Password(onChanged: (data) {
              pass = data;
            }),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              borderRadius: 14,
              onTap: () {
                if (key.currentState!.validate()) {
                  print(email);
                  context.read<RegisterBloc>().add(RegisterSubmitted(
                      email: email, password: pass, name: fullname));
                }
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
