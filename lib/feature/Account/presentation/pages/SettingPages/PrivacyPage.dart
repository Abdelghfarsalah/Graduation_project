import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

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
        title: const Text('Privacy'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🔒 Privacy Commitment', style: headingStyle),
            const SizedBox(height: 10),
            Text(
              'We value your privacy and are committed to safeguarding the personal data you share with us. This page explains what we collect, why, and how it is protected.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('📄 Data Collection', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'We only collect the data that is strictly necessary to provide and improve our services, including your name, email address, and usage statistics.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('📌 Use of Data', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'Collected data is used to enhance user experience, improve application performance, and ensure account security. We do not sell your data.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🚫 Third-Party Sharing', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'We do not share your personal data with third parties unless legally required or with your explicit consent.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🔍 Transparency', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'You can request a copy of your data at any time. We believe in complete transparency when it comes to how your information is handled.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🗑️ Data Deletion', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'You have the right to request the deletion of your personal data. Once deleted, it is permanently removed from our systems.',
              style: bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
