import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Back_button.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/OtpcodeContainer.dart';

class VerifyPhoneNumbercodebody extends StatefulWidget {
  const VerifyPhoneNumbercodebody({super.key});

  @override
  State<VerifyPhoneNumbercodebody> createState() =>
      _VerifyPhoneNumbercodebodyState();
}

class _VerifyPhoneNumbercodebodyState extends State<VerifyPhoneNumbercodebody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: backButton(),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                OtpcodeContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
