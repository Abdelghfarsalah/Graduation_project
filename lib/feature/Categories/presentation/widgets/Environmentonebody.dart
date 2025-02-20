import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Categories/doamin/Entities/Enviromentmodel.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/ProgarmCard.dart';

class Environmentonebody extends StatelessWidget {
  const Environmentonebody({super.key, required this.Programs});
  final List<Enviromentmodel> Programs;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      sliver: SliverGrid.builder(
        itemCount: Programs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 20,
            mainAxisExtent: MediaQuery.of(context).size.height * 0.2),
        itemBuilder: (context, index) => Progarmcard(
          model: Programs[index],
        ),
      ),
    );
  }
}
