import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/RecommendationsystemState.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystembloc.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystemevent.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/TechRate.dart';

class Recommendationsystembody extends StatelessWidget {
  const Recommendationsystembody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please rate your interest in the following subjects using one of the options",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: appFonts.Poppins,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000)),
            ),
            SizedBox(
              height: 10,
            ),

            Techrate(
              onTap: () {},
              color: Color(0xffA7D7DA),
              text: 'Computer Architecture',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffDAB9A7),
              text: 'Leadership Experience',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffA8A7DA),
              text: 'Cyber Security',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffD0A7DA),
              text: 'Networking',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffDAAAA7),
              text: 'Software Development',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffC0DAA7),
              text: 'Programming Skills',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xff95B2DE),
              text: 'Project Management',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffEBE07C),
              text: 'Forensics Fundamentals',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffDAA7C2),
              text: 'Technical Communication',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffB7E4C7),
              text: 'AI_ML',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffFBC4AB),
              text: 'Software Engineering',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xff89CFF0),
              text: 'Business Analysis',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffC0DAA7),
              text: 'Database_Fundamentals',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffD8BFD8),
              text: 'Communication Skills',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            ////
            Techrate(
              onTap: () {},
              color: Color(0xffD8BFD8),
              text: 'Data Science',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffD8BFD8),
              text: 'Troubleshooting Skills',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffD8BFD8),
              text: 'Graphics Designing',
              width: MediaQuery.of(context).size.width * 0.5,
            ),

            ///////

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
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
