import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showLoadingAnalog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return _AnimatedLoadingDialog();
    },
  );
}

class _AnimatedLoadingDialog extends StatefulWidget {
  @override
  State<_AnimatedLoadingDialog> createState() => _AnimatedLoadingDialogState();
}

class _AnimatedLoadingDialogState extends State<_AnimatedLoadingDialog> {
  String message = "Generating your personalized roadmap...";
  String animatiofile = "assets/lottei/Animation - 1747582239237.json";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 10), () {
      setState(() {
        message = "Optimizing content based on your preferences...";
        animatiofile = "assets/lottei/Animation - 1747582500907.json";
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // CircularProgressIndicator(
          //   color: Colors.teal,
          // ),
          Lottie.asset(animatiofile),
          SizedBox(height: 20),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Text(
              message,
              key: ValueKey<String>(message),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.teal.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
