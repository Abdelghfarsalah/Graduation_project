import 'package:flutter/material.dart';

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final headingStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.grey[900],
    );
    final subheadingStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.grey[900],
    );
    final bodyStyle = TextStyle(
      fontSize: 16,
      color: Colors.grey[800],
      height: 1.6,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Report & Problem'),
        backgroundColor: const Color(0xffF4F4F7),
        foregroundColor: Colors.black,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🐞 Reporting Problems', style: headingStyle),
            const SizedBox(height: 10),
            Text(
              'We value your feedback and are committed to providing a smooth experience. If you encounter any problems or bugs, please report them to help us improve.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('⚠️ What to Report', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              '• App crashes or freezes\n'
              '• Features not working as expected\n'
              '• UI/UX issues\n'
              '• Performance problems\n'
              '• Security concerns',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('📬 How to Report', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'You can report problems through the following methods:\n\n'
              '• Email us at support@example.com\n'
              '• Contact us on our social media channels\n'
              '• Use the in-app feedback form (coming soon)',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🔧 What Happens Next?', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'After receiving your report, our team will investigate the issue and work on a solution. We may contact you for additional details if needed.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🙏 Thank You', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'Your reports help us build a better app for everyone. We appreciate your support and patience.',
              style: bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
