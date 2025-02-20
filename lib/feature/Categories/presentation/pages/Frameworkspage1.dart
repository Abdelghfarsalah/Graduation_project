import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Custom_button.dart';
import 'package:graduation_project/feature/Categories/presentation/pages/Frameworkspage2.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/BackendTrack.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/frontEndtrack.dart';

class Frameworks extends StatelessWidget {
  const Frameworks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          "Frameworks",
          style: TextStyle(
              color: appColor.Primarycolor,
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Frontendtrack(),
              Backendtrack(),
              Spacer(),
              CustomButton(
                borderRadius: 14,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Frameworkstow()),
                  );
                },
                endcolor: Color(0xff9CC7FF),
                color: Color(0xff5FA5FF),
                width: MediaQuery.of(context).size.width,
                text: 'Continue',
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
