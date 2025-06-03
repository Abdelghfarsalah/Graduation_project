import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Account/data/dataSources/datasourecs.dart';
import 'package:graduation_project/feature/Account/data/repoimpl/repoimplemnts.dart';
import 'package:graduation_project/feature/Account/presentation/manager/delete/deletebloc.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_avatar/update_avatar_bloc.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_name/update_name_bloc.dart';
import 'package:graduation_project/feature/Authentication/data/apis/AuthDataSources.dart';
import 'package:graduation_project/feature/Authentication/data/repoImple/Loginrepoimple.dart';
import 'package:graduation_project/feature/Authentication/domain/usecase/VerifyEmailUsecase.dart';
import 'package:graduation_project/feature/Authentication/domain/usecase/loginUsecase.dart';
import 'package:graduation_project/feature/Authentication/domain/usecase/registerusecase.dart';
import 'package:graduation_project/feature/Authentication/domain/usecase/resendotpusecase.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Login/Login_bloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Register/register_bloc.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/resetpassword/Resetpassbloc.dart';
import 'package:graduation_project/feature/Community/data/communityDataSourses.dart';
import 'package:graduation_project/feature/Community/presentation/manager/chnage_chat/chnage_chat_bloc.dart';
import 'package:graduation_project/feature/Community/presentation/manager/community_chat_bloc/community_chat_bloc_bloc.dart';
import 'package:graduation_project/feature/Courses/data/Api/coursesDataSources.dart';
import 'package:graduation_project/feature/Courses/data/repoimplemts/CoursesrepoImple.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/course_progress/course_progress_bloc.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystembloc.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatbloc.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarBloc.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_bloc.dart';

class AppBlocProviders {
  static getblocprovider({required Widget child}) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CommunityChatBlocBloc(
            datasources: Communitydatasourses(dio: Dio())),
      ),
      BlocProvider(
        create: (context) => ChnageChatBloc(),
      ),
      BlocProvider(
          create: (context) => CourseProgressBloc(
                  coursesrepo: Coursesrepoimple(
                coursesdatasources: Coursesdatasources(
                  dio: Dio(),
                ),
              ))),
      BlocProvider(create: (context) => Bottomnavbarbloc()),
      BlocProvider(create: (context) => BotBloc()),
      BlocProvider(
        create: (context) => LoginBloc(
            Loginusecase(
              authrepo: Authrepoimple(
                datasource: Authdatasources(dio: Dio()),
              ),
            ),
            Authrepoimple(
              datasource: Authdatasources(dio: Dio()),
            )),
      ),
      BlocProvider(
        create: (context) => RegisterBloc(
          Registerusecase(
            authrepo: Authrepoimple(
              datasource: Authdatasources(dio: Dio()),
            ),
          ),
          VerifyEmailusecase(
              repo: Authrepoimple(
            datasource: Authdatasources(dio: Dio()),
          )),
          Resendotpusecase(
            repo: Authrepoimple(
              datasource: Authdatasources(dio: Dio()),
            ),
          ),
        ),
      ),
      BlocProvider(create: (context) => Recommendationsystembloc()),
      BlocProvider(
        create: (context) => Resetpassbloc(
          Authrepoimple(
            datasource: Authdatasources(dio: Dio()),
          ),
        ),
      ),
      BlocProvider(
        create: (context) => DeleteBloc(
          accountRepoimplemnts(
            data: accountdatasources(
              dio: Dio(),
            ),
          ),
        ),
      ),
      BlocProvider(
        create: (context) => ReccomendChatBlocBloc(dio: Dio()),
      ),
      BlocProvider(
        create: (context) => UpdateAvatarBloc(
            accountRepoimplemnts(data: accountdatasources(dio: Dio()))),
      ),
      BlocProvider(
        create: (context) => UpdateNameBloc(
            accountRepoimplemnts(data: accountdatasources(dio: Dio()))),
      )
    ], child: child);
  }
}
