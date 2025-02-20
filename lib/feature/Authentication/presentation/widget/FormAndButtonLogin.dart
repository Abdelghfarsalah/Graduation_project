import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Login/Login_bloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Login/Login_event.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Login/Login_states.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/ForgetPassword.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Custom_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Email.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Password.dart';
import 'package:graduation_project/feature/home/presentation/pages/home.dart';

class FormAndButtonLogin extends StatefulWidget {
  const FormAndButtonLogin({super.key});

  @override
  State<FormAndButtonLogin> createState() => _FormAndButtonLoginState();
}

class _FormAndButtonLoginState extends State<FormAndButtonLogin> {
  GlobalKey<FormState> key = GlobalKey();
  String email = "";
  String pass = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
          key: key,
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            EmailTextField(onChanged: (data) {
              email = data;
            }),
            SizedBox(
              height: 20,
            ),
            Password(onChanged: (data) {
              pass = data;
            }),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Forgetpassword(),
                    ),
                  );
                },
                child: Text(
                  "Forget Password ?",
                  style: TextStyle(
                    fontFamily: appFonts.Poppins,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff323142),
                  ),
                ),
              ),
            ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }
              },
              child: CustomButton(
                borderRadius: 14,
                onTap: () {
                  if (key.currentState!.validate()) {
                    context
                        .read<LoginBloc>()
                        .add(LoginSubmitted(email: email, password: pass));
                  }
                },
                endcolor: Color(0xff9CC7FF),
                color: Color(0xff5FA5FF),
                width: MediaQuery.of(context).size.width,
                text: 'Login',
              ),
            ),
          ])),
    );
  }
}
