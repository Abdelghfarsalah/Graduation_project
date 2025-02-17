import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/customTextFiled.dart';

class Verificationphonetextfiled extends StatelessWidget {
  const Verificationphonetextfiled({super.key, required this.onChanged});
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Customtextfiled(
      obscureText: false,
      hintText: "+00 0000000 000",
      labal: "+00 0000000 000",
      prefixicon: SvgPicture.asset(
        "assets/Icons/Phone.svg",
        height: 19,
        width: 16,
        fit: BoxFit.none,
      ),
      onChanged: onChanged,
      validator: (data) {
        if (data!.isEmpty) {
          return "Phone is required";
        }
        return null;
      },
      focusNode: FocusNode(),
      prefixiconfocus: SvgPicture.asset(
        "assets/Icons/ActivePhone.svg",
        height: 19,
        width: 16,
        fit: BoxFit.none,
      ),
    );
  }
}
