import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Mentorpage extends StatefulWidget {
  const Mentorpage({super.key});

  @override
  State<Mentorpage> createState() => _MainPageState();
}

class _MainPageState extends State<Mentorpage> {
  late WebViewController _controler;

  @override
  void initState() {
    _controler = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://adplist.org'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: _controler)),
    );
  }
}
