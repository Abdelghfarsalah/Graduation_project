import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarBloc.dart';

class AppBlocProviders {
  static getblocprovider({required Widget child}) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => Bottomnavbarbloc()),
    ], child: child);
  }
}
