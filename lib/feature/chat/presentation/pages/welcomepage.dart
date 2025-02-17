import 'package:flutter/material.dart';
import 'package:graduation_project/feature/chat/presentation/widget/welcomepagebody.dart';

class WelcomepageChabot extends StatelessWidget {
  const WelcomepageChabot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffD3D7D8).withOpacity(0.3),
                      blurRadius: 24,
                      spreadRadius: 0,
                      offset: Offset(6, 11))
                ]),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
        ),
      ),
      body: Welcomepagebody(),
    );
  }
}
