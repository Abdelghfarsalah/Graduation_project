import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/Custom_button.dart';
import 'package:graduation_project/feature/Categories/presentation/pages/Environmenttow.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/CloudComputing.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/DatabaseEnvironments.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/IntegratedDevelopment.dart';

class Environmentone extends StatelessWidget {
  const Environmentone({super.key});

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
          "Environment",
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Integrateddevelopment(),
                // Backendtrack(),
                SizedBox(
                  height: 20,
                ),
                Databaseenvironments(),
                SizedBox(
                  height: 20,
                ),
                Cloudcomputing(),
                CustomButton(
                  borderRadius: 14,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Environmenttow()),
                    );
                  },
                  endcolor: Color(0xff9CC7FF),
                  color: Color(0xff5FA5FF),
                  width: MediaQuery.of(context).size.width,
                  text: 'Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
