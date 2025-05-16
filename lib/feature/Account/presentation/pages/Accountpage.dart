import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Account/presentation/manager/delete/update_avatar/update_avatar_bloc.dart';
import 'package:graduation_project/feature/Account/presentation/manager/delete/update_avatar/update_avatar_state.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/Accountcard.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/BackgroundimageinAccount.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/DisplayPersonalinformation.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/PersonalInformationOther.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/SettingIcon.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Accountpage extends StatefulWidget {
  const Accountpage({super.key});

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  bool inAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateAvatarBloc, UpdateAvatarStatus>(
      listener: (context, state) {
        if (state is UpdateAvatarLoading) {
          inAsyncCall = true;
        } else {
          inAsyncCall = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5,
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: LoadingIndicator(
                indicatorType: Indicator.lineScale,
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
          child: CustomScrollView(
            // physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Backgroundimageinaccount(),
                      Settingicon(),
                      Accountcard(),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                        fontFamily: appFonts.Poppins,
                        fontSize: 17,
                        color: appColor.Primarycolor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              Displaypersonalinformation(),
              Personalinformationother(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 15,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
