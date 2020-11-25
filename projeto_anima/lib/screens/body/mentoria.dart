import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projeto_anima/service/url_form.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:projeto_anima/util/loading.dart';
import 'package:projeto_anima/screens/home/authenticate/sign_in.dart';

class Mentoria extends StatelessWidget {
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
            new WebView(
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
