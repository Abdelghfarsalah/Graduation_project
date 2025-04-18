import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_bloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_state.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/Questionspage.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Verifyemailcoderegisterpagebody.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Verifyemailcoderegisterpage extends StatelessWidget {
  const Verifyemailcoderegisterpage({super.key, required this.email});
  final String email;
  @override
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return Scaffold(
        backgroundColor: Color(0xff5EA5FF),
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is VerifyEmailloading) {
              loading = true;
            } else if (state is VerifyEmailFaliuer) {
              Fluttertoast.showToast(
                  msg: "Please Enter Correct Otp .",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  fontSize: 16.0.sp);

              loading = false;
            } else if (state is VerifyEmailsuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Questionspage(),
                ),
              );

              loading = false;
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: loading,
                opacity: 0.2,
                color: appColor.Primarycolor,
                progressIndicator: CircularProgressIndicator(
                  color: appColor.Primarycolor,
                ),
                child: Verifyemailcoderegisterpagebody(
                  Email: email,
                ));
          },
        ));
  }
}
