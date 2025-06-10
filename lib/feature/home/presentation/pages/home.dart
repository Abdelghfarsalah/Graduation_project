import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/core/utils/helper.dart';
import 'package:graduation_project/feature/Community/presentation/pages/mainCommunity.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/progressPage.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarBloc.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarEvent.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarState.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<Bottomnavbarbloc>(context);
    return BlocConsumer<Bottomnavbarbloc, Bottomnavbarstate>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: bloc.pages[bloc.currentindex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(66, 223, 222, 222),
                  blurRadius: 24,
                  spreadRadius: 0,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: BottomNavigationBar(
                selectedItemColor: appColor.Primarycolor,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                currentIndex: bloc.currentindex,
                backgroundColor: Colors.white,
                onTap: (index) {
                  bloc.add(ChangeEvent(index: index));
                },
                items: Helper.Bottomnavbaritems()),
          ),
        );
      },
      listener: (BuildContext context, state) {
        if (state is BottomnavbarstateChaneg) {
          if (state.index == 2) {
            Animationsforpages.navigateWithSlidepushfrombottpm(
                context, Maincommunity());
          }
          if (state.index == 1) {
            Animationsforpages.navigateWithSlidepushfrombottpm(
                context, Progresspage());
          }
        }
      },
    );
  }
}
