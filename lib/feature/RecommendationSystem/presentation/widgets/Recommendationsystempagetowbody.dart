import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/RecommendationsystemState.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystembloc.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystemevent.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/PageTowcontent.dart';

class Recommendationsystempagetowbody extends StatelessWidget {
  const Recommendationsystempagetowbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Interest",
              style: TextStyle(
                  fontFamily: appFonts.Poppins,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2D3748)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              color: Color(0xffEBFBFC),
              padding: EdgeInsets.all(20),
              child: Pagetowcontent(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: BlocListener<Recommendationsystembloc,
                  Recommendationsystemstate>(
                listener: (context, state) {
                  if (state is recommendSuccess) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Column(
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.greenAccent),
                              child: Center(
                                child: Text(
                                  state.jops[0].job,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.greenAccent),
                              child: Center(
                                child: Text(
                                  state.jops[1].job,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.greenAccent),
                              child: Center(
                                child: Text(
                                  state.jops[2].job,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    print(context.read<Recommendationsystembloc>().rates);
                    // context.read<Recommendationsystembloc>().printmapin();
                    context.read<Recommendationsystembloc>().add(recommendEvent(
                        data: context.read<Recommendationsystembloc>().rates));
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff5FA5FF),
                          Color(0xff9CC7FF),
                        ]),
                        color: Color(0xff5FA5FF),
                        borderRadius: BorderRadius.circular(35)),
                    child: Center(
                      child: Text(
                        "Predict",
                        style: TextStyle(
                            fontFamily: appFonts.Poppins,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
