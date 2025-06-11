import 'package:flutter/widgets.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/models/staticTrackmodels.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/tracksCard.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/widgets/tracksSearchField.dart';

class Stataictrackspagebodycontent extends StatelessWidget {
  final TracksResponse data;
  const Stataictrackspagebodycontent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BeautifulSearchField(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Trackscard(
                  title: data.items[index].title,
                  image: data.items[index].icon,
                  id: data.items[index].id,
                );
              },
              childCount: data.items.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 20,
            ),
          ),
        ),
      ],
    );
  }
}
