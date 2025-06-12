import 'package:flutter/material.dart';

class TermsAndPoliciesPage extends StatelessWidget {
  const TermsAndPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final headingStyle = TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey[800]);
    final subheadingStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey[800]);
    final bodyStyle =
        TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.6);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Terms & Policies'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📄 Terms of Service', style: headingStyle),
            const SizedBox(height: 10),
            Text(
              'By using our app, you agree to comply with and be bound by the following terms and conditions. Please read them carefully.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🔹 User Responsibilities', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'You agree to use the app lawfully and responsibly. You must not misuse the app or engage in any activity that disrupts its normal functioning.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🔹 Privacy Policy', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'We respect your privacy and handle your personal data with utmost care. Please review our Privacy Policy to understand how your information is collected and used.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🔹 Intellectual Property', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'All content within this app, including text, images, and logos, are owned by us or our licensors. Unauthorized use or reproduction is prohibited.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🔹 Limitation of Liability', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'We are not liable for any damages or losses arising from the use or inability to use the app. Use the app at your own risk.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🔹 Changes to Terms', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'We reserve the right to modify these terms at any time. Continued use of the app constitutes acceptance of any changes.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🔹 Contact Us', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'If you have any questions or concerns about these terms, please contact our support team.',
              style: bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
