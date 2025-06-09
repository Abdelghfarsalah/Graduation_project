import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/recommendChat/data/rescommendChatdatasources.dart';
import 'package:graduation_project/feature/recommendChat/domain/models/RoadmapModel%20.dart';
import 'package:graduation_project/feature/recommendChat/domain/repo/roadmaprpo.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_bloc.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/start_learning_tracks/start_learning_tracks_bloc.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/StartLearnbuttonInAgnentmessages.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/displaytimeLine.dart';

class Agentmessage extends StatelessWidget {
  const Agentmessage({super.key, required this.text});
  final Roadmapmodel2 text;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartLearningTracksBloc(
          Roadmaprpo(datasources: Rescommendchatdatasources(dio: Dio()))),
      child: IntrinsicWidth(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                  height: 30.h,
                  width: 30.w,
                  child: Image.asset("assets/Icons/logo.png")),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.75,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                      // border: Border.all(color: Color(0xffDEE2E6), width: 1.2),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black.withOpacity(0.05),
                      //     blurRadius: 10,
                      //     offset: Offset(0, 4),
                      //   )
                      // ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 0),
                          child: Text(
                            text.title ?? '',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 20),
                          child: Text(
                            "This roadmap is divided into ${text.steps!.length} sections  as follows.",
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 0),
                          child: ListView.builder(
                              itemCount: text.steps!.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Text(
                                    "${index + 1} - ${text.steps![index].stepTitle}.",
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 176, 176, 176),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: appFonts.Poppins,
                                      letterSpacing: 0.5,
                                    ),
                                  )),
                        ),

                        /// الزر
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 0),
                            child: ElevatedButton(
                              onPressed: () {
                                Animationsforpages.navigateWithSlidepush(
                                  context,
                                  Displaytimeline(mdoel: text),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shadowColor: Colors.blue.withOpacity(0.3),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF2196F3), // Bright blue
                                      Color(0xFF64B5F6), // Lighter blue
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 12.h),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Show Timeline',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.8,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        size: 24.sp,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Startlearnbuttoninagnentmessages(
                          text: BlocProvider.of<ReccomendChatBlocBloc>(context)
                              .SaveMaptoStartLearning,
                        ),

                        SizedBox(height: 18.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
