import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/customTextFiled.dart';

class FullName extends StatelessWidget {
  const FullName({super.key, required this.onChanged});
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Customtextfiled(
      obscureText: false,
      hintText: "Full Name",
      labal: "Enter Full Name",
      prefixicon: SvgPicture.asset(
        "assets/Icons/User Icon.svg",
        height: 19,
        width: 16,
        fit: BoxFit.none,
      ),
      onChanged: onChanged,
      validator: (data) {
        if (data!.isEmpty) {
          return "Fullname is Required";
        }
        return null;
      },
      focusNode: FocusNode(),
      prefixiconfocus: SvgPicture.asset(
        "assets/Icons/User Icon (1).svg",
        height: 19,
        width: 16,
        fit: BoxFit.none,
      ),
    );
  }
}
