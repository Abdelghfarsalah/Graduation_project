import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/Accountcard.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/BackgroundimageinAccount.dart';

class Accountpage extends StatelessWidget {
  const Accountpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [Backgroundimageinaccount(), Accountcard()],
    );
  }
}
