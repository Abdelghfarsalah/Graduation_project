import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/customTextFiled.dart';

class Password extends StatefulWidget {
  const Password({super.key, required this.onChanged});
  final void Function(String) onChanged;

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool obscureText = true;
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Customtextfiled(
      obscureText: obscureText,
      hintText: "Password",
      labal: "Password",
      prefixicon: SvgPicture.asset(
        "assets/Icons/Lock Icon.svg",
        height: 19,
        width: 16,
        fit: BoxFit.none,
      ),
      onChanged: widget.onChanged,
      validator: (data) {
        if (data!.isEmpty) {
          return "Password is Required";
        }
        return null;
      },
      suffixicon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: !obscureText
            ? Icon(FontAwesomeIcons.eye, size: 18, color: Color(0xff1A6EFC))
            : Icon(
                FontAwesomeIcons.eyeSlash,
                size: 18,
              ),
      ),
      focusNode: focusNode,
      prefixiconfocus: SvgPicture.asset(
        "assets/Icons/Lock Icon (1).svg",
        height: 19,
        width: 16,
        fit: BoxFit.none,
      ),
    );
  }
}
