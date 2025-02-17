import 'package:flutter/material.dart';

class darweritem extends StatelessWidget {
  const darweritem(
      {super.key, required this.title, this.onTap, required this.icon});
  final String title;
  final void Function()? onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            title: Text("$title"),
            trailing: icon,
          ),
          const Divider(
            height: 2,
            color: Colors.grey,
            endIndent: 10,
            indent: 10,
          )
        ],
      ),
    );
  }
}
