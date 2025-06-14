import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/resetpassword/Resetpassbloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/resetpassword/Resetpassevent.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/resetpassword/Resetpassstate.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Back_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Create_your_accout_Text.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Custom_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Password.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Resetyourpasswordpage extends StatefulWidget {
  const Resetyourpasswordpage({super.key, required this.email});
  final String email;
  @override
  State<Resetyourpasswordpage> createState() => _ResetyourpasswordpageState();
}

class _ResetyourpasswordpageState extends State<Resetyourpasswordpage> {
  String pass = "";
  String Confirmpass = "";
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return BlocConsumer<Resetpassbloc, Resetpassstate>(
      listener: (context, state) {
        if (state is forgetpasswordresetLoading) {
          loading = true;
        } else if (state is forgetpasswordresetSuccess) {
          Fluttertoast.showToast(
              msg: "Password updated successfull \n PLease Login Again",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0);

          // Navigator.pop(context);
          // Navigator.pop(context);
          Navigator.popUntil(context, (route) => route.isFirst);

          loading = false;
        } else {
          Fluttertoast.showToast(
              msg: "Please enter a valid Password.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0);
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
          child: Scaffold(
            backgroundColor: Color(0xff5EA5FF),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backButton(),
                  CreateYourAccoutText(
                    title: "Reset Your Password",
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Form(
                              key: key,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Password(onChanged: (data) {
                                    pass = data;
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(". Password should be 8-20 characters",
                                      style: TextStyle(
                                          fontFamily: appFonts.Poppins,
                                          fontSize: 12.sp,
                                          color: Color(0xff838383))),
                                  Text(
                                      ". Password should have a lower case letter",
                                      style: TextStyle(
                                          fontFamily: appFonts.Poppins,
                                          fontSize: 12.sp,
                                          color: Color(0xff838383))),
                                  Text(
                                      ". Password should have a upper case letter",
                                      style: TextStyle(
                                          fontFamily: appFonts.Poppins,
                                          fontSize: 12.sp,
                                          color: Color(0xff838383))),
                                  Text(
                                      ". Password should have a number or\n    acceptable characters",
                                      style: TextStyle(
                                          fontFamily: appFonts.Poppins,
                                          fontSize: 12.sp,
                                          color: Color(0xff838383))),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text("Confirm Password",
                                      style: TextStyle(
                                          fontFamily: appFonts.Poppins,
                                          fontSize: 14.sp,
                                          color: Color(0xff282828))),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Password(onChanged: (data) {
                                    Confirmpass = data;
                                  }),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomButton(
                                    borderRadius: 14.r,
                                    onTap: () {
                                      if (pass != Confirmpass) {
                                        Fluttertoast.showToast(
                                            msg: "Passwords must be similar.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.blue,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                      if (key.currentState!.validate() &&
                                          pass == Confirmpass) {
                                        context.read<Resetpassbloc>().add(
                                            forgetpasswordreset(
                                                email: widget.email,
                                                newpass: pass));
                                      }
                                    },
                                    endcolor: Color(0xff9CC7FF),
                                    color: Color(0xff5FA5FF),
                                    width: MediaQuery.of(context).size.width,
                                    text: 'Reset',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
