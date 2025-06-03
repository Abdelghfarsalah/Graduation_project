import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Courses/domain/models/Section.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/displaySection.dart';

class Viewcoursepagebody extends StatelessWidget {
  const Viewcoursepagebody(
      {super.key, required this.sections, required this.image});
  final List<Section> sections;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(image), fit: BoxFit.fill)),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: sections.length,
              itemBuilder: (context, index) => Displaysection(
                    section: sections[index],
                    index: index,
                  )),
        ),
      ],
    );
  }
}
