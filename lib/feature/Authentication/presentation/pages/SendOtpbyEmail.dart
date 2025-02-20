import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/resetpassword/Resetpassbloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/resetpassword/Resetpassstate.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/SendOtpByemailBody.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/VerifyEmailcodeForResetPassword.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Sendotpbyemail extends StatelessWidget {
  const Sendotpbyemail({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return BlocConsumer<Resetpassbloc, Resetpassstate>(
      listener: (context, state) {
        if (state is forgetpasswordLoading) {
          loading = true;
        } else if (state is forgetpasswordSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Verifyemailcodeforresetpassword(
                email: state.email,
              ),
            ),
          );
          loading = false;
        } else {
          Fluttertoast.showToast(
              msg: "Please enter a valid email.",
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
        return Scaffold(
          backgroundColor: Color(0xff5EA5FF),
          body: ModalProgressHUD(
              inAsyncCall: loading,
              opacity: 0.2,
              color: appColor.Primarycolor,
              progressIndicator: CircularProgressIndicator(
                color: appColor.Primarycolor,
              ),
              child: Sendotpbyemailbody()),
        );
      },
    );
  }
}
