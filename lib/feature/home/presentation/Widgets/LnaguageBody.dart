import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/LanguageCard.dart';
import 'package:graduation_project/feature/home/domain/Entities/LanguageModel.dart';

class Lnaguagebody extends StatelessWidget {
  const Lnaguagebody({super.key, required this.languages});
  final List<Languagemodel> languages;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      sliver: SliverGrid.builder(
        itemCount: languages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 20,
            mainAxisExtent: MediaQuery.of(context).size.height * 0.2),
        itemBuilder: (context, index) => Languagecard(
          model: languages[index],
        ),
      ),
    );
  }
}
