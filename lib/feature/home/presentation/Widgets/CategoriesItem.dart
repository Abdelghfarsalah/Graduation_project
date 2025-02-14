import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';

class Categoriesitem extends StatelessWidget {
  const Categoriesitem(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(image: AssetImage(image))),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: appFonts.Poppins,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1F1F39)),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  child: Text(
                    subtitle,
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: appFonts.Poppins,
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff828282)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
