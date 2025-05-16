import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/showBottomSheettoupdateImage.dart';

class Editavatarimage extends StatelessWidget {
  const Editavatarimage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80.h,
      left: 100.w,
      child: Container(
        height: 35.h,
        width: 35.w,
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                      child: Showbottomsheettoupdateimage()));
            },
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
