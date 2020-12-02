import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:projeto_anima/screens/body/acompanhamento.dart';
import 'package:projeto_anima/screens/body/capacitacao.dart';
import 'package:projeto_anima/screens/home/home.dart';
import 'package:projeto_anima/util/certificado.dart';
import 'package:projeto_anima/util/loading.dart';
import 'package:share_extend/share_extend.dart';

class CertificadoView extends StatefulWidget {
  @override
  _CertificadoViewState createState() => _CertificadoViewState();
}

class _CertificadoViewState extends State<CertificadoView> {
  Certificado certificado = Certificado();
  @override
  /*void initState() {
    super.initState();
    certificado.generateExampleDocument();
  }*/

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: certificado.generateExampleDocument(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            } else {
              return PDFViewerScaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        await Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Home()),
                            (Route<dynamic> route) => false);
                      },
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
