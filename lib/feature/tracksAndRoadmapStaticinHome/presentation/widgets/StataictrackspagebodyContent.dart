import 'package:flutter/widgets.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/models/staticTrackmodels.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/tracksCard.dart';

class Stataictrackspagebodycontent extends StatelessWidget {
  final TracksResponse data;
  const Stataictrackspagebodycontent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GridView.builder(
            itemCount: data.items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return Trackscard(
                title: data.items[index].title,
                image: data.items[index].icon,
                id: data.items[index].id,
              );
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            // لو داخل ScrollView
          ),
        ),
      ],
    );
  }
}
