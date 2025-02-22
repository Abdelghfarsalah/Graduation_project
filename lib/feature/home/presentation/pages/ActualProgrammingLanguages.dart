import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/LangsHelper.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/ContinueButton.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/LnaguageBody.dart';
import 'package:graduation_project/feature/home/presentation/pages/LanguageLibraryProgramming.dart';

class Actualprogramminglanguages extends StatelessWidget {
  const Actualprogramminglanguages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: appColor.Primarycolor,
            )),
        centerTitle: true,
        title: Text(
          "Programming Programs",
          style: TextStyle(
              color: appColor.Primarycolor,
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: CustomScrollView(slivers: [
            // Environmentonebody(
            //   Programs: Enviromenthelper.ProgrammingPrograms,
            // ),
            Lnaguagebody(
              languages: Langshelper.actualProgrammingLanguages,
            ),
            SliverToBoxAdapter(
              child: Continuebutton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Languagelibraryprogramming()),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
