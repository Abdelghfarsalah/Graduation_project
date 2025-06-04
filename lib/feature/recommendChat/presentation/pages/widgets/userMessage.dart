import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/DisplayAccountImage.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_bloc.dart';

class Usermessage extends StatelessWidget {
  const Usermessage({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<String?>(
            future: SharedPreferencesDemo.getavatar(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              } else if (snapshot.hasError ||
                  !snapshot.hasData ||
                  snapshot.data == null) {
                return CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: FittedBox(
                    child: CircleAvatar(
                      radius: 15 - 1,
                      backgroundImage: AssetImage(
                        "assets/HomeImage/default.png",
                      ), // صورة افتراضية
                    ),
                  ),
                );
              } else {
                return GestureDetector(
                  onLongPress: () {
                    CustomDialogForAccountAvatar.showCustomImageDialog(
                        context, snapshot.data!);
                  },
                  onTap: () {
                    print(snapshot.data!);
                    CustomDialogForAccountAvatar.showCustomImageDialog(
                        context, snapshot.data!);
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            snapshot.data!)), // من المسار اللي محفوظ في Shared
                  ),
                );
              }
            },
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: 10.r, left: 5.r, right: 5.r, top: 5.r),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 3.w,
                ),
                IntrinsicWidth(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth:
                          MediaQuery.of(context).size.width * 0.6, // أقصى عرض
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 15),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.73,
                          child: Text(
                            text,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: appFonts.Poppins,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Spacer(),
                IconButton(
                    onPressed: () {
                      context.read<ReccomendChatBlocBloc>().controller.text =
                          text;
                    },
                    icon: Icon(
                      FontAwesomeIcons.penToSquare,
                      size: 17,
                      color: Colors.grey.withOpacity(0.5),
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
