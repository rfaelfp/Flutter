import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_extend/share_extend.dart';

class CertificadoView extends StatefulWidget {
  @override
  _CertificadoViewState createState() => _CertificadoViewState();
}

class _CertificadoViewState extends State<CertificadoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Certificação'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                iconSize: 30,
                onPressed: () {
                  /* ShareExtend.share("file",
                      sharePanelTitle: "Enviar PDF", subject: "example-pdf");*/
                }),
          )
        ],
      ),
    );
  }
}
