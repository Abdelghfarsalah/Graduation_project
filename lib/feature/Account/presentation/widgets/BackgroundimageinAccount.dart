import 'package:flutter/material.dart';

class Backgroundimageinaccount extends StatelessWidget {
  const Backgroundimageinaccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipPath(
        clipper: CustomTriangleClipper(),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.3,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/HomeImage/Accountimages/pawel-czerwinski-8uZPynIu-rQ-unsplash 1.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

// ✨ `CustomClipper` لقص الجزء السفلي من اليسار عند 75% من ارتفاع الصورة
class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0); // الزاوية العلوية اليسرى
    path.lineTo(size.width, 0); // الزاوية العلوية اليمنى
    path.lineTo(size.width, size.height); // الزاوية السفلية اليمنى
    path.lineTo(0, size.height * 0.75); // نقطة القص من 75% من الحافة اليسرى
    path.close(); // إغلاق الشكل

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
