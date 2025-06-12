import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

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
        title: const Text('Security'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🔐 Security Overview', style: headingStyle),
            const SizedBox(height: 10),
            Text(
              'We are dedicated to maintaining the highest standards of security. Your data is protected using robust measures that ensure both safety and privacy.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🔒 Encryption Protocols', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'All user data is encrypted using Advanced Encryption Standard (AES-256), ensuring that all sensitive information remains private and inaccessible to unauthorized parties.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🛡️ Authentication Systems', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'We enforce secure authentication practices, including password hashing and salting, to protect user credentials. Failed login attempts are monitored and rate-limited.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('📱 Device Monitoring', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'Our system keeps track of all devices logged into your account. You can view your device activity and contact support if any suspicious behavior is noticed.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('📊 Security Audits', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'We perform regular internal audits and vulnerability assessments to identify and resolve security risks. Third-party penetration testing is also conducted annually.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🧠 Staff Training', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'All team members receive regular training on security best practices, secure coding, and data handling protocols to prevent human error.',
              style: bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
