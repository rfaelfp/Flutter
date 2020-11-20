import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Mentoria extends StatelessWidget {
  final String urlForm =
      "https://docs.google.com/forms/d/e/1FAIpQLSdQT7Cn7bnW0QhtZSXeueelAhk0s2a-NsfrykaMLIasY3bZrw/viewform";
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: urlForm,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
