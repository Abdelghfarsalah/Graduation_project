import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/RecommendationsystemState.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystembloc.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/RecommendationsystemappBar.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/Recommendationsystembody.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Recommendationsystempage extends StatefulWidget {
  const Recommendationsystempage({super.key});

  @override
  State<Recommendationsystempage> createState() =>
      _RecommendationsystempageState();
}

class _RecommendationsystempageState extends State<Recommendationsystempage> {
  bool inAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Recommendationsystembloc, Recommendationsystemstate>(
      listener: (context, state) {
        if (state is recommendLoading) {
          inAsyncCall = true;
        } else {
          inAsyncCall = false;
        }
      },
      builder: (BuildContext context, state) {
        return ModalProgressHUD(
          progressIndicator: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.95,
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: LoadingIndicator(
                indicatorType: Indicator.ballScaleMultiple,
                colors: const [
                  Color(0xFFF5F5F5),
                  Color(0xFF90CAF9),
                  Color(0xFF64B5F6),
                  Color(0xFF42A5F5),
                  Color(0xFF1565C0),
                ],
                strokeWidth: 0,
                backgroundColor: Colors.transparent,
                pathBackgroundColor: Colors.transparent),
          ),
          inAsyncCall: inAsyncCall,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: RecommendationsystemappBar(),
            body: Recommendationsystembody(),
          ),
        );
      },
    );
  }
}
//Recommendationsystembloc
