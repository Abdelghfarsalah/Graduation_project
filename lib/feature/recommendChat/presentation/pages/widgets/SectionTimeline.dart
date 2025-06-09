import 'package:flutter/material.dart';
import 'package:graduation_project/feature/recommendChat/domain/models/RoadmapModel%20.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/CustomDropDownbutton.dart';

class Sectiontimeline extends StatefulWidget {
  const Sectiontimeline({super.key, required this.mdoel});
  final Roadmapmodel2 mdoel;

  @override
  State<Sectiontimeline> createState() => _SectiontimelineState();
}

class _SectiontimelineState extends State<Sectiontimeline> {
  List<Color> blueWhiteGradientColors = [
    Color(0xFFF0F8FF),
    Color(0xFFE0F7FA),
    Color(0xFFB3E5FC),
    Color(0xFF81D4FA),
    Color(0xFFF0F8FF),
    Color(0xFFE0F7FA),
    Color(0xFFB3E5FC),
    Color(0xFFF0F8FF),
    Color(0xFFE0F7FA),
    Color(0xFFB3E5FC),
    Color(0xFFF0F8FF),
    Color(0xFFE0F7FA),
    Color(0xFFB3E5FC),
    Color(0xFFF0F8FF),
    Color(0xFFE0F7FA),
    Color(0xFFB3E5FC),
    Color(0xFF81D4FA),
    Color(0xFFF0F8FF),
    Color(0xFFE0F7FA),
    Color(0xFFB3E5FC),
    Color(0xFFF0F8FF),
    Color(0xFFE0F7FA),
    Color(0xFFB3E5FC),
    Color(0xFFF0F8FF),
    Color(0xFFE0F7FA),
    Color(0xFFB3E5FC),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.mdoel.steps!.length,
      itemBuilder: (context, index) {
        return Container(
          color:
              blueWhiteGradientColors[index % blueWhiteGradientColors.length],
          child: _KeepAliveWrapper(
            child: CustomDropdown(
              mdoel: widget.mdoel,
              indedx: index,
              selectedItem: widget.mdoel.steps![index].stepTitle ?? "",
            ),
          ),
        );
      },
    );
  }
}

/// هذا الـ Widget بسيط نستخدمه لحفظ حالة أي عنصر بداخله
class _KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const _KeepAliveWrapper({Key? key, required this.child}) : super(key: key);

  @override
  State<_KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<_KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // مهم جداً
    return widget.child;
  }
}
