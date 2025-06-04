import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystembloc.dart';

class Ratewidget extends StatefulWidget {
  const Ratewidget({super.key, required this.onTap, required this.tech});
  final void Function() onTap;
  final String tech;
  @override
  State<Ratewidget> createState() => _RatewidgetState();
}

class _RatewidgetState extends State<Ratewidget> {
  // List<String> emojis = [
  //   "🏆",
  //   "😍",
  //   "🚫",
  //   "📊",
  // ];
  //emojis[index]}
  List<String> statuses = [
    "Excellent",
    "Beginner",
    "Not Interested",
    "Average",
  ];

  int select = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: Center(
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(), // يمنع التمرير
          itemCount: statuses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 50),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                context.read<Recommendationsystembloc>().ChangeValuerate(
                    widget.tech.replaceFirstMapped(
                        RegExp(r'^( *)(.*?)( *)$'),
                        (match) =>
                            '${match[1]}${match[2]!.replaceAll(' ', '_')}${match[3]}'),
                    statuses[index]);

                setState(() {
                  select = index;
                });
              },
              child: Row(
                children: [
                  select == index
                      ? Icon(
                          Icons.check_box,
                          color: appColor.Primarycolor,
                        )
                      : Icon(
                          Icons.check_box_outline_blank_outlined,
                          size: 18,
                        ),
                  Text(
                    "${statuses[index]}",
                    style: TextStyle(
                        fontFamily: appFonts.Poppins,
                        fontSize: select == index ? 16.sp : 14.sp,
                        fontWeight:
                            select == index ? FontWeight.w600 : FontWeight.w500,
                        color:
                            select == index ? Color(0xff000000) : Colors.grey),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
