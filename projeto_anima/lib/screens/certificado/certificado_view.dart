import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:projeto_anima/util/certificado.dart';
import 'package:projeto_anima/util/loading.dart';

class CertificadoView extends StatefulWidget {
  @override
  _CertificadoViewState createState() => _CertificadoViewState();
}

class _CertificadoViewState extends State<CertificadoView> {
  Certificado certificado = Certificado();
  String generatedPdfFilePath;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: certificado.generateExampleDocument(),
          builder: (context, snapshot) {
            if (!snapshot.data) {
              return Loading();
            } else {
              return PDFViewerScaffold(
                path: snapshot.data,
              );
            }
          },
        ),
      ),
    );
  }
}
