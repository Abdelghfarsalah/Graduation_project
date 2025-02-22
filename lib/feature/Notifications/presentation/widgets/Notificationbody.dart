import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Notifications/presentation/widgets/CommonNotification.dart';
import 'package:graduation_project/feature/Notifications/presentation/widgets/Others.dart';
import 'package:graduation_project/feature/Notifications/presentation/widgets/Systemservicesupdate.dart';

class Notificationbody extends StatelessWidget {
  const Notificationbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Commonnotification(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                color: Color(0xffEEEEEE),
                height: 1,
                thickness: 1,
                endIndent: 20,
                indent: 20,
              ),
            ),
            Systemservicesupdate(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                color: Color(0xffEEEEEE),
                height: 1,
                thickness: 1,
                endIndent: 20,
                indent: 20,
              ),
            ),
            Others()
          ],
        ),
      ),
    );
  }
}
