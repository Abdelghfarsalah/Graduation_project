import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Account/presentation/pages/Accountpage.dart';
import 'package:graduation_project/feature/Community/presentation/pages/Communitypage.dart';
import 'package:graduation_project/feature/Search/presentation/pages/Searchpage.dart';
import 'package:graduation_project/feature/chat/presentation/pages/welcomepage.dart';
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
    Searchpage(),
    Communitypage(),
    WelcomepageChabot(),
    Accountpage()
  ];
  void _Changeindex(ChangeEvent event, Emitter<Bottomnavbarstate> emit) {
    currentindex = event.index;
    emit(BottomnavbarstateChaneg());
  }
}
