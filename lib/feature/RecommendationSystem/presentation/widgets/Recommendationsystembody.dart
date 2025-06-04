import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/RecommendationsystemState.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystembloc.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystemevent.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/TechRate.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/recommendchatPage.dart';

class Recommendationsystembody extends StatefulWidget {
  const Recommendationsystembody({super.key});

  @override
  State<Recommendationsystembody> createState() =>
      _RecommendationsystembodyState();
}

class _RecommendationsystembodyState extends State<Recommendationsystembody> {
  final Color cardcolor = appColor.Primarycolor;

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
              color: cardcolor,
              text: 'Programming Skills',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Computer Architecture',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Technical Communication',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Cyber Security',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'AI',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Biology Biochemistry Basic',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Networking',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Troubleshooting Skills',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Database Fundamentals',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Leadership Experience',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Project Management',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Software Engineering',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Business knowledge',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Communication Skills',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Data Science',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: cardcolor,
              text: 'Graphics Designing',
              width: MediaQuery.of(context).size.width * 0.5,
            ),

            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffA7D7DA),
            //   text: 'Computer Architecture',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffDAB9A7),
            //   text: 'Leadership Experience',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffA8A7DA),
            //   text: 'Cyber Security',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffD0A7DA),
            //   text: 'Networking',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffDAAAA7),
            //   text: 'Software Development',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffC0DAA7),
            //   text: 'Programming Skills',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xff95B2DE),
            //   text: 'Project Management',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffEBE07C),
            //   text: 'Forensics Fundamentals',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffDAA7C2),
            //   text: 'Technical Communication',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffB7E4C7),
            //   text: 'AI_ML',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffFBC4AB),
            //   text: 'Software Engineering',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xff89CFF0),
            //   text: 'Business Analysis',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffC0DAA7),
            //   text: 'Database_Fundamentals',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffD8BFD8),
            //   text: 'Communication Skills',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // ////
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffD8BFD8),
            //   text: 'Data Science',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffD8BFD8),
            //   text: 'Troubleshooting Skills',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            // Techrate(
            //   onTap: () {},
            //   color: Color(0xffD8BFD8),
            //   text: 'Graphics Designing',
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),

            Align(
              alignment: Alignment.center,
              child: BlocListener<Recommendationsystembloc,
                  Recommendationsystemstate>(
                listener: (context, state) {
                  if (state is recommendSuccess) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        contentPadding: EdgeInsets.all(20),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '🚀 Recommended Jobs for You',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: appColor.Primarycolor,
                                  fontFamily: appFonts.Poppins),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Choose the path that matches your skills and start your journey! ✨',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: appFonts.Poppins),
                            ),
                          ],
                        ),
                        content: ListView(
                          children: [
                            ...List.generate(3, (index) {
                              final job = state.jops[index].job;
                              // final icons = [
                              //   Icons.code,
                              //   Icons.design_services,
                              //   Icons.mobile_friendly
                              // ];
                              // final colors = [
                              //   // Colors.blue.shade100,
                              //   // Colors.blue.shade50,
                              //   // Colors.blue.shade200,
                              //   appColor.Primarycolor,
                              //   appColor.Primarycolor,
                              //   appColor.Primarycolor,
                              //   appColor.Primarycolor,
                              // ];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    // gradient: LinearGradient(
                                    //   colors: [
                                    //     colors[index % colors.length],
                                    //     Colors.white
                                    //   ],
                                    //   begin: Alignment.topLeft,
                                    //   end: Alignment.bottomRight,
                                    // ),
                                    color: appColor.Primarycolor,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: appColor.Primarycolor),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black12,
                                    //     blurRadius: 4,
                                    //     offset: Offset(0, 2),
                                    //   )
                                    // ],
                                  ),
                                  child: ListTile(
                                    // leading: Icon(icons[index % icons.length],
                                    //     size: 28, color: Colors.teal),
                                    title: Text(
                                      job,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontFamily: appFonts.Poppins),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios,
                                        size: 16, color: Colors.white),
                                    onTap: () async {
                                      // context
                                      //     .read<ReccomendChatBlocBloc>()
                                      //     .add(ClearMessages());
                                      // context.read<ReccomendChatBlocBloc>().add(
                                      //     Fetchroadmap(state.jops[index].job));
                                      Animationsforpages.navigateWithSlidepush(
                                          context,
                                          Recommendchatpage(
                                            text: state.jops[index].job,
                                          ));
                                    },
                                  ),
                                ),
                              );
                            }),
                            SizedBox(height: 15),
                            Text(
                              'If you want to generate a learning roadmap, just tap on a job.',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: appFonts.Poppins),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Close',
                                style: TextStyle(color: appColor.Primarycolor)),
                          )
                        ],
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
/**  */
