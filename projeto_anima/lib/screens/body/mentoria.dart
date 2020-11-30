import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firestore.instance
          .collection('form')
          .getDocuments()
          .then((value) => value.documents[0].data['urlForm']),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        } else {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return IndexedStack(
                index: _stackToView,
                children: [
                  WebView(
                    initialUrl: snapshot.data,
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
      },
    );
  }
}
