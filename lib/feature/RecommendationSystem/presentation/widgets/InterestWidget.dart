import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/manager/Recommendationsystembloc/Recommendationsystembloc.dart';

class Interestwidget extends StatefulWidget {
  const Interestwidget({super.key, required this.text});
  final String text;

  @override
  State<Interestwidget> createState() => _InterestwidgetState();
}

class _InterestwidgetState extends State<Interestwidget> {
  bool select = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            select = !select;
            context
                .read<Recommendationsystembloc>()
                .ChangeValueInterest(widget.text, select);
          });
        },
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Color(0xff3E6D81),
                ),
              ),
              child: select
                  ? Center(
                      child: Icon(
                        Icons.done,
                        color: Color(0xff3E6D81),
                        size: 15,
                      ),
                    )
                  : null,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontFamily: appFonts.Poppins,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000)),
            )
          ],
        ),
      ),
    );
  }
}
