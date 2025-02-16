import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';

class Cybersecurittestingenvironments extends StatelessWidget {
  const Cybersecurittestingenvironments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "Cybersecurity & Testing Environments",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: appColor.Primarycolor,
                fontFamily: appFonts.Poppins,
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Techcard(
          text: "Kali Linux (for penetration testing)",
          width: MediaQuery.sizeOf(context).width * 0.6,
          color: Color(0xffD8BFD8),
        ),
        Techcard(
          text: "Metasploit Framework",
          width: 230,
          color: Color(0xffDAAAA7),
        ),
        Techcard(
          text: "Wireshark (for network monitoring & analysis)",
          width: 230,
          color: Color(0xffFFC1CC),
        ),
      ],
    );
  }
}
// Cybersecurity & Testing Environments
