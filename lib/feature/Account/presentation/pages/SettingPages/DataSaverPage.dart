import 'package:flutter/material.dart';

class DataSaverPage extends StatelessWidget {
  const DataSaverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final headingStyle = TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey[900]);
    final subheadingStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey[900]);
    final bodyStyle =
        TextStyle(fontSize: 16, color: Colors.grey[800], height: 1.6);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Data Saver & Cache Policy'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📉 Data Saver Overview', style: headingStyle),
            const SizedBox(height: 10),
            Text(
              'Our app is designed to help you save mobile data while ensuring smooth and fast performance. We optimize data usage through caching and intelligent network management.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('📦 Cache Usage', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'To reduce data consumption and improve load times, we store frequently accessed content locally on your device using cache. This means images, videos, and other data don’t need to be downloaded repeatedly.',
              style: bodyStyle,
            ),
            const SizedBox(height: 16),
            Text(
              'Cache helps:\n'
              '• Load content faster even when offline or on slow networks.\n'
              '• Reduce cellular data usage by avoiding unnecessary downloads.\n'
              '• Improve overall app responsiveness.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('📶 Cellular Data Optimization', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'When you are using cellular data (mobile network), our app automatically adjusts its behavior to save your data plan:',
              style: bodyStyle,
            ),
            const SizedBox(height: 8),
            Text(
              '• Images and videos load in lower quality.\n'
              '• Background syncs and updates are limited.\n'
              '• Automatic downloads are disabled unless connected to Wi-Fi.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🔄 User Control', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'You can enable or disable Data Saver mode anytime from the app settings to fit your preferences and data availability.',
              style: bodyStyle,
            ),
            const SizedBox(height: 24),
            Text('🔒 Privacy & Security', style: subheadingStyle),
            const SizedBox(height: 8),
            Text(
              'Despite data saving measures, your privacy and security remain our top priority. All cached data is stored securely and no personal information is shared without your consent.',
              style: bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
