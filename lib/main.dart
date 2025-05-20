import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Bloc_providers.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/Main_onboarding.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/WelcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: "AIzaSyAB6GPly8gecYvCVDFkRfZ7C6msqtF0Z5s");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  ;
  final bool seenOnboarding = await SharedPreferencesDemo.getFirstTime();
  runApp(AppBlocProviders.getblocprovider(
    child: GraduationProject(
      seenOnboarding: seenOnboarding,
    ),
  ));
}

class GraduationProject extends StatelessWidget {
  const GraduationProject({super.key, required this.seenOnboarding});
  final bool seenOnboarding;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411, 843),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: seenOnboarding ? MainOnboarding() : WelcomePage(),
          );
        });
  }
}
