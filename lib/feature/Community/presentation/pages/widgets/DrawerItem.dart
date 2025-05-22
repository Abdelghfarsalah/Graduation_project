import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/DrawerHeader.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/displayGroupIcons.dart';

class Draweritem extends StatelessWidget {
  const Draweritem({super.key, required this.groupsResponse});
  final GroupsResponse groupsResponse;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // Drawer Header

        CustomDrawerheader(),
        // Drawer Items
        Displaygroupicons(
          groupsResponse: groupsResponse,
        ),
      ],
    );
  }
}
