import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

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
        title: const Text('Help & Support'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🆘 Help & Support Overview', style: headingStyle),
            const SizedBox(height: 10),
            Text(
              'We’re here to help! Whether you’re facing an issue, have a question, or need guidance, our support team is always ready to assist you.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('📩 Contact Methods', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'You can reach out to us via email or our contact form. We aim to respond to all queries within 24 hours.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🌐 Connect with Us', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'Follow and message us on any of the following platforms:',
              style: bodyStyle,
            ),
            const SizedBox(height: 12),
            _buildSocialRow(
                icon: Icons.facebook, name: 'Facebook', link: '@OurCompany'),
            _buildSocialRow(
                icon: Icons.camera_alt, name: 'Instagram', link: '@OurCompany'),
            _buildSocialRow(
                icon: Icons.chat, name: 'Messenger', link: '@OurCompany'),
            _buildSocialRow(
                icon: Icons.alternate_email,
                name: 'Twitter (X)',
                link: '@OurCompany'),
            _buildSocialRow(
                icon: Icons.mail,
                name: 'Email',
                link: 'support@ourcompany.com'),
            const SizedBox(height: 24),
            Text('📖 FAQ & Tutorials', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'Check our Help Center for step-by-step tutorials and frequently asked questions to quickly find the answers you need.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🙋 Live Support', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'Live chat support is available from 9:00 AM to 5:00 PM (UTC). Tap the chat icon in the bottom corner to start.',
              style: bodyStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialRow(
      {required IconData icon, required String name, required String link}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[800]),
          const SizedBox(width: 10),
          Text('$name: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
              child: Text(link, style: TextStyle(color: Colors.grey[700]))),
        ],
      ),
    );
  }
}
