import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Account/presentation/pages/Accountpage.dart';
import 'package:graduation_project/feature/Community/presentation/pages/mainCommunity.dart';
import 'package:graduation_project/feature/Courses/presentation/pages/Coursespage.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/progressPage.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/homebody.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarEvent.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarState.dart';

class Bottomnavbarbloc extends Bloc<Bottomnavbarevent, Bottomnavbarstate> {
  Bottomnavbarbloc() : super(Bottomnavbarstateinit()) {
    on<ChangeEvent>(_Changeindex);
  }
  int currentindex = 0;
  List<Widget> pages = [
    Homebody(),
    Progresspage(),
    Maincommunity(),
    CoursesPage(),
    Accountpage()
  ];
  void _Changeindex(ChangeEvent event, Emitter<Bottomnavbarstate> emit) {
    emit(BottomnavbarstateChaneg(index: event.index));
    if (event.index != 2 && event.index != 1) {
      currentindex = event.index;
    }
  }
}
