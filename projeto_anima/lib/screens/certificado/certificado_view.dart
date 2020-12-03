import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:projeto_anima/models/user.dart';
import 'package:projeto_anima/util/certificado.dart';
import 'package:projeto_anima/util/loading.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

class CertificadoView extends StatefulWidget {
  final String titulo;
  final Map map;
  CertificadoView(this.titulo, this.map);
  @override
  _CertificadoViewState createState() => _CertificadoViewState();
}

class _CertificadoViewState extends State<CertificadoView> {
  Certificado certificado = Certificado();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: certificado.generateExampleDocument(
              widget.titulo, user.uid, widget.map),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            } else {
              return PDFViewerScaffold(
                  appBar: AppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/log2.png',
                          fit: BoxFit.contain,
                          height: 26,
                        )
                      ],
                    ),
                    backgroundColor: Colors.white,
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.black),
                        onPressed: () {
                          ShareExtend.share(snapshot.data, "file",
                              sharePanelTitle: "Enviar PDF",
                              subject: "example-pdf");
                        },
                      ),
                    ],
                  ),
                  path: snapshot.data);
            }
          },
        ),
      ),
    );
  }
}
