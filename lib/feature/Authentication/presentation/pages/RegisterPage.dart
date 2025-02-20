import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_bloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_state.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/VerifyemailcodeRegisterpage.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/registerBody.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return Scaffold(
      backgroundColor: Color(0xff5EA5FF),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          print(state);
          if (state is RegisterLoading) {
            loading = true;
          } else if (state is RegisterFailure) {
            Fluttertoast.showToast(
                msg: "Please enter a valid email and password .",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 16.0);

            loading = false;
          } else if (state is RegisterSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Verifyemailcoderegisterpage(
                  email: context.read<RegisterBloc>().Email,
                ),
              ),
            );
            // Navigator.pushAndRemoveUntil(context,
            //     MaterialPageRoute(builder: (context) => Home()), (d) => false);
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
              child: Registerbody());
        },
      ),
    );
  }
}
