import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projeto_anima/service/url_form.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:projeto_anima/util/loading.dart';

class Mentoria extends StatefulWidget {
  @override
  _MentoriaState createState() => _MentoriaState();
}

class _MentoriaState extends State<Mentoria> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  num _stackToView = 1;
  final String urlForm = UrlForm.url.toString();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return IndexedStack(
          index: _stackToView,
          children: [
            WebView(
              initialUrl: urlForm,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onPageFinished: (finish) {
                setState(
                  () {
                    _stackToView = 0;
                  },
                );
              },
            ),
            Center(
              child: Loading(),
            ),
          ],
        );
      },
    );
  }
}
