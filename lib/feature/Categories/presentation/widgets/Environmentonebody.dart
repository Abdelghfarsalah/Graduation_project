import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/EnviromentHelper.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/ProgarmCard.dart';

class Environmentonebody extends StatelessWidget {
  const Environmentonebody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      sliver: SliverGrid.builder(
        itemCount: Enviromenthelper.ProgrammingPrograms.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => Progarmcard(
          model: Enviromenthelper.ProgrammingPrograms[index],
        ),
      ),
    );
  }
}
