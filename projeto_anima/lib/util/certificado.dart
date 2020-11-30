import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfLib;

class Certificado {
  BuildContext context;
  String nome;
  String sobrenome;
  String cpf;

  Certificado({this.context, this.nome, this.sobrenome, this.cpf});

  _creatPdf() async {
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);

    pdf.addPage(pdfLib.MultiPage(
        build: (context) => [
              pdfLib.Table.fromTextArray(data: <List<String>>[
                <String>['Nome', 'Sobrenome', 'Idade'],
                [nome, sobrenome, cpf]
              ])
            ]));

    final String dir = (await getApplicationDocumentsDirectory()).path;

    final String path = '$dir/pdfExample.pdf';
    final File file = File(path);
    file.writeAsBytesSync(pdf.save());
  }
}
