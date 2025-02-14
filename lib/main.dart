import 'package:flutter/material.dart';
import 'package:graduation_project/core/Bloc_providers.dart';
import 'package:graduation_project/feature/home/presentation/pages/home.dart';

void main() {
  runApp(
    AppBlocProviders.getblocprovider(
      child: const GraduationProject(),
    ),
  );
}

class GraduationProject extends StatelessWidget {
  const GraduationProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
