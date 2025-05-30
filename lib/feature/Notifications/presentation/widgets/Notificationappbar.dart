import 'package:flutter/material.dart';

class Notificationappbar extends StatelessWidget
    implements PreferredSizeWidget {
  const Notificationappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: Color(0xff5EA5FF)),
      ),
      title: Text(
        "Notifications",
        style: TextStyle(
          fontFamily: "Poppins", // تأكد أن الخط معرف لديك
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xff5EA5FF),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
