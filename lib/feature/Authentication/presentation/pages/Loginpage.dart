import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Login/Login_bloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Login/Login_states.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Loginbody.dart';
import 'package:graduation_project/feature/home/presentation/pages/home.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return Scaffold(
      backgroundColor: Color(0xff5EA5FF),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            loading = true;
          } else if (state is LoginFailure) {
            Fluttertoast.showToast(
                msg: "Please enter a valid email and password.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 16.0);

            loading = false;
          } else {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => Home()), (d) => false);
          }
        },
        builder: (context, state) => ModalProgressHUD(
            inAsyncCall: loading,
            opacity: 0.2,
            color: appColor.Primarycolor,
            progressIndicator: CircularProgressIndicator(
              color: appColor.Primarycolor,
            ),
            child: Loginbody()),
      ),
    );
  }
}
