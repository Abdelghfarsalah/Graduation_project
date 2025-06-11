import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/feature/Search/domain/Entities/SearchModel.dart';
import 'package:graduation_project/feature/home/domain/Entities/PopularTracksmode.dart';

class Helper {
  static void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/Icons/AvatarSuccess.png",
                      height: 150,
                      width: 150,
                      fit: BoxFit.none,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Congratulations",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Your Account is Ready to Use. You will be\n"
                  "redirected to the Home Page in a Few Seconds.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff167F71),
                  ),
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(
                  color: Colors.blue,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );

    // // إغلاق الـ Dialog بعد 3 ثوانٍ والانتقال إلى الصفحة الرئيسية
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pop(); // إغلاق الـ Dialog
    //   Navigator.pushReplacementNamed(context, '/home'); // انتقل إلى الصفحة الرئيسية
    // });
  }

  static List<BottomNavigationBarItem> Bottomnavbaritems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.house,
            size: 21,
          ),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.bar_chart,
            size: 21,
          ),
          label: "Learning"),
      BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.users,
            size: 21,
          ),
          label: "Community"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.school,
            size: 21,
          ),
          label: "Courses"),
      BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.user,
            size: 21,
          ),
          label: "Account"),
    ];
  }

  static final List<Populartracksmodel> Populartracks = [
    Populartracksmodel(
      Image: "assets/HomeImage/populartracks/3DDesign.png",
      title: "3D Design",
    ),
    Populartracksmodel(
      Image: "assets/HomeImage/populartracks/Graphic Design.png",
      title: "Graphic Design",
    ),
    Populartracksmodel(
      Image: "assets/HomeImage/populartracks/Web Development.png",
      title: "Web Development",
    ),
    Populartracksmodel(
      Image: "assets/HomeImage/populartracks/SEO & Marketing.png",
      title: "SEO & Marketing",
    ),
    Populartracksmodel(
      Image: "assets/HomeImage/populartracks/Finance & Accounting.png",
      title: "Finance & Accounting",
    ),
    Populartracksmodel(
      Image: "assets/HomeImage/populartracks/Personal Development.png",
      title: "Personal Development",
    ),
    Populartracksmodel(
      Image: "assets/HomeImage/populartracks/Office Productivity.png",
      title: "Office Productivity",
    ),
    Populartracksmodel(
      Image: "assets/HomeImage/populartracks/HR Management.png",
      title: "HR Management",
    )
  ];
  static final List<Searchmodel> searchresult = [
    Searchmodel(
        image: "assets/HomeImage/SearchImages/Design System.png",
        title: "Design System"),
    Searchmodel(
        image: "assets/HomeImage/SearchImages/UX Design.png",
        title: "UX Design"),
    Searchmodel(
        image: "assets/HomeImage/SearchImages/Design Development.png",
        title: "Design Development"),
    Searchmodel(
        image: "assets/HomeImage/SearchImages/UX Design.png",
        title: "UI Design"),
    Searchmodel(
        image: "assets/HomeImage/SearchImages/OR &Design Support.png",
        title: "OR &Design Support"),
    Searchmodel(
        image: "assets/HomeImage/SearchImages/Graphic Design.png",
        title: "Graphic Design"),
  ];
}
