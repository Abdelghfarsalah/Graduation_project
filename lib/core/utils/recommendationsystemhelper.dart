// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_bloc.dart';
// import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_event.dart';

// class Recommendationsystemhelper {
//   static void showanalogFordiplayJops{
//      showDialog(
//                       barrierDismissible: false,
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         contentPadding: EdgeInsets.all(20),
//                         title: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '🚀 Recommended Jobs for You',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.teal,
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               'Choose the path that matches your skills and start your journey! ✨',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           ],
//                         ),
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             ...List.generate(3, (index) {
//                               final job = state.jops[index].job;
//                               final icons = [
//                                 Icons.code,
//                                 Icons.design_services,
//                                 Icons.mobile_friendly
//                               ];
//                               final colors = [
//                                 Colors.teal.shade100,
//                                 Colors.teal.shade50,
//                                 Colors.teal.shade200
//                               ];
//                               return Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 6),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         colors[index % colors.length],
//                                         Colors.white
//                                       ],
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                     ),
//                                     borderRadius: BorderRadius.circular(15),
//                                     border:
//                                         Border.all(color: Colors.teal.shade200),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black12,
//                                         blurRadius: 4,
//                                         offset: Offset(0, 2),
//                                       )
//                                     ],
//                                   ),
//                                   child: ListTile(
//                                     leading: Icon(icons[index % icons.length],
//                                         size: 28, color: Colors.teal),
//                                     title: Text(
//                                       job,
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.teal.shade800,
//                                       ),
//                                     ),
//                                     trailing: Icon(Icons.arrow_forward_ios,
//                                         size: 16, color: Colors.teal),
//                                     onTap: () {
//                                       context
//                                           .read<ReccomendChatBlocBloc>()
//                                           .add(ClearMessages());
//                                       context.read<ReccomendChatBlocBloc>().add(
//                                           Fetchroadmap(state.jops[index].job));
//                                       Animationsforpages
//                                           .navigateWithSlidepushandreplace(
//                                               context, Recommendchatpage());
//                                     },
//                                   ),
//                                 ),
//                               );
//                             }),
//                             SizedBox(height: 15),
//                             Text(
//                               'If you want to generate a learning roadmap, just tap on a job.',
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontStyle: FontStyle.italic,
//                                 color: Colors.grey.shade700,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () => Navigator.pop(context),
//                             child: Text('Close',
//                                 style: TextStyle(color: Colors.teal)),
//                           )
//                         ],
//                       ),
//                     );
                  
//   }
// }