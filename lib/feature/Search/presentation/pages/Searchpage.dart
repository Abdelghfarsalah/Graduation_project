import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Search/presentation/widgets/DisplaySearchResult.dart';
import 'package:graduation_project/feature/Search/presentation/widgets/SearchResualt.dart';
import 'package:graduation_project/feature/Search/presentation/widgets/SearchpageTextFiled.dart';
import 'package:graduation_project/feature/Search/presentation/widgets/customAppbarsearch.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          Customappbarsearch(),
          Searchpagetextfiled(),
          Searchresult(),
          Displaysearchresult(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).padding.bottom + 10,
            ),
          )
        ],
      ),
    );
  }
}
