import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class Customshareicon extends StatelessWidget {
  const Customshareicon({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0.h, right: 10.r, left: 10.w),
      child: GestureDetector(
        onTap: () {
          final text = '${msg}';
          Share.share(text);
        },
        child: Icon(
          FontAwesomeIcons.share,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
