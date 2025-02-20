import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_bloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/resetpassword/Resetpassbloc.dart';

class Otp extends StatefulWidget {
  const Otp({super.key, required this.Formkey});
  final GlobalKey<FormState> Formkey;
  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  void saveOtpValues() {
    String otpCode = _controllers.map((controller) => controller.text).join();
    context.read<RegisterBloc>().otp = otpCode;
    context.read<Resetpassbloc>().otp = otpCode;
    print("Entered OTP: $otpCode");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Form(
        key: widget.Formkey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(6, (index) {
            return buildOtpField(index);
          }),
        ),
      ),
    );
  }

  Widget buildOtpField(int index) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        validator: (data) {
          if (data!.isEmpty) {
            return "";
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }

          if (_controllers.every((controller) => controller.text.isNotEmpty)) {
            saveOtpValues();
          }
        },
        style: TextStyle(
          color: Color(0xff0050D0),
          fontFamily: appFonts.Poppins,
          fontWeight: FontWeight.w300,
        ),
        cursorColor: Colors.green, // تغيير لون المؤشر
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
