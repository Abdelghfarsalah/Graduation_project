import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystembloc.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatbloc.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarBloc.dart';

class AppBlocProviders {
  static getblocprovider({required Widget child}) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => Bottomnavbarbloc()),
      BlocProvider(create: (context) => BotBloc()),
      BlocProvider(create: (context) => Recommendationsystembloc()),
    ], child: child);
  }
}
