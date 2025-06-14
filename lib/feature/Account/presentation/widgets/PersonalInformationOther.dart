// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:graduation_project/core/colors.dart';
// import 'package:graduation_project/core/fonts.dart';
// import 'package:graduation_project/feature/Notifications/presentation/pages/Notificationpages.dart';

// class Personalinformationother extends StatelessWidget {
//   const Personalinformationother({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Other",
//               style: TextStyle(
//                   fontFamily: appFonts.Poppins,
//                   fontSize: 17.sp,
//                   color: appColor.Primarycolor,
//                   fontWeight: FontWeight.w700),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20.0),
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: Text(
//                       "Language",
//                       style: TextStyle(
//                           fontFamily: appFonts.Poppins,
//                           fontSize: 14.sp,
//                           color: Color(0xff001A4D),
//                           fontWeight: FontWeight.w400),
//                     ),
//                     trailing: IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.grey,
//                         )),
//                   ),
//                   ListTile(
//                     title: Text(
//                       "Notification Settings",
//                       style: TextStyle(
//                           fontFamily: appFonts.Poppins,
//                           fontSize: 14.sp,
//                           color: Color(0xff001A4D),
//                           fontWeight: FontWeight.w400),
//                     ),
//                     trailing: IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Notificationpages()),
//                           );
//                         },
//                         icon: Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.grey,
//                         )),
//                   ),
//                   SizedBox(height: 20.h),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       height: 45.h,
//                       width: MediaQuery.of(context).size.width * 0.55,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6),
//                           gradient: LinearGradient(
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                               colors: [
//                                 Color(0xff5FA5FF),
//                                 Color(0xff9CC7FF),
//                               ])),
//                       child: Center(
//                         child: Text(
//                           "Save changes",
//                           style: TextStyle(
//                               fontFamily: appFonts.Poppins,
//                               fontSize: 20.sp,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
