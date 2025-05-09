import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_bloc.dart';

class Usermessage extends StatelessWidget {
  const Usermessage({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.r, left: 5.r, right: 5.r, top: 5.r),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffDEE2E6),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          children: [
            // Padding(
            //   padding: EdgeInsets.only(left: 2.r),
            //   child: Container(
            //     height: 37.h,
            //     width: 37.w,
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage("assets/Bot/Snederinbot.png"))),
            //   ),
            // ),
            SizedBox(
              width: 3.w,
            ),
            IntrinsicWidth(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth:
                      MediaQuery.of(context).size.width * 0.73, // أقصى عرض
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.73,
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  context.read<ReccomendChatBlocBloc>().controller.text = text;
                },
                icon: Icon(
                  FontAwesomeIcons.penToSquare,
                  size: 17,
                  color: Colors.grey.withOpacity(0.5),
                ))
          ],
        ),
      ),
    );
  }
}
