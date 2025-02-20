import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Authentication/data/apis/AuthDataSources.dart';
import 'package:graduation_project/feature/Authentication/data/repoImple/Loginrepoimple.dart';
import 'package:graduation_project/feature/Authentication/domain/usecase/loginUsecase.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Login/Login_bloc.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystembloc.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatbloc.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarBloc.dart';

class AppBlocProviders {
  static getblocprovider({required Widget child}) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => Bottomnavbarbloc()),
      BlocProvider(create: (context) => BotBloc()),
      BlocProvider(
        create: (context) => LoginBloc(
          Loginusecase(
            authrepo: Authrepoimple(
              datasource: Authdatasources(dio: Dio()),
            ),
          ),
        ),
      ),
      BlocProvider(create: (context) => Recommendationsystembloc()),
    ], child: child);
  }
}
