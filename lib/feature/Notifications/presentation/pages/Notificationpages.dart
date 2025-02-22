import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Notifications/presentation/widgets/Notificationappbar.dart';
import 'package:graduation_project/feature/Notifications/presentation/widgets/Notificationbody.dart';

class Notificationpages extends StatelessWidget {
  const Notificationpages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Notificationappbar(),
      body: Notificationbody(),
    );
  }
}
