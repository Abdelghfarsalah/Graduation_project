import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/customTextFiled.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.onChanged});
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Customtextfiled(
      obscureText: false,
      hintText: "Enter Your Email",
      labal: "Enter Your Email",
      prefixicon: SvgPicture.asset(
        "assets/Icons/Email Icon.svg",
        height: 19,
        width: 16,
        fit: BoxFit.none,
      ),
      onChanged: onChanged,
      validator: (data) {
        if (data!.isEmpty) {
          return "Email is Required";
        }
        return null;
      },
      focusNode: FocusNode(),
      prefixiconfocus: SvgPicture.asset(
        "assets/Icons/Email Icon (1).svg",
        height: 19,
        width: 16,
        fit: BoxFit.none,
      ),
    );
  }
}
