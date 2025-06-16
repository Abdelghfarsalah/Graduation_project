import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

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
              icon: Icons.facebook,
              name: 'Facebook',
              link: 'https://www.facebook.com/share/15fsdgYUeL/',
            ),
            _buildSocialRow(
              icon: Icons.camera_alt,
              name: 'Instagram',
              link:
                  'https://www.instagram.com/abdelghafar.salah?igsh=cWVqNXltaWJnbGtl',
            ),
            _buildSocialRow(
              icon: Icons.chat,
              name: 'Messenger',
              link:
                  'https://www.facebook.com/share/15fsdgYUeL/', // هذا هو رابط ماسنجر الصحيح
            ),
            _buildSocialRow(
              icon: Icons.alternate_email,
              name: 'Twitter (X)',
              link:
                  'https://x.com/Abdelghfar80987?t=rYKnztQjP6SDSjlsu7Gv4w&s=09',
            ),
            _buildSocialRow(
              icon: Icons.mail,
              name: 'abdelghfarsalah8@gmail.com',
              link: 'abdelghfarsalah8@gmail.com',
            ),
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

  Widget _buildSocialRow({
    required IconData icon,
    required String name,
    required String link,
    Color? iconColor,
  }) {
    // تحديد لون الأيقونة حسب المنصة إذا لم يتم تحديد لون مخصص
    final Color platformColor = iconColor ?? _getPlatformColor(name);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [],
      ),
      child: GestureDetector(
        onTap: () async {
          final Uri url = Uri.parse(link);
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                child: Icon(icon, size: 24, color: platformColor),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  '$name',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// دالة مساعدة لتحديد ألوان المنصات المختلفة
  Color _getPlatformColor(String platform) {
    switch (platform.toLowerCase()) {
      case 'facebook':
        return Color(0xFF1877F2);
      case 'twitter':
        return Color(0xFF1DA1F2);
      case 'instagram':
        return Color(0xFFE4405F);
      case 'linkedin':
        return Color(0xFF0A66C2);
      case 'youtube':
        return Color(0xFFFF0000);
      case 'whatsapp':
        return Color(0xFF25D366);
      default:
        return Colors.blue;
    }
  }
}
