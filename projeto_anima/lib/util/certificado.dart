import 'dart:io';

import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projeto_anima/service/database.dart';

class Certificado {
  String generatedPdfFilePath;
  Future<String> generateExampleDocument(
      String titulo, String uid, Map map) async {
    String nome = map['nome'] + ' ' + map['sobrenome'];
    var htmlContent = """
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div style=" width: 100%; height: 0; height: 400px;
padding-bottom: 48px; box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); margin-top: 1.6em; margin-bottom: 0.9em;
border-radius: 8px; background-color:#222B32; padding-top: 20px;">
    
    <h1 style="text-align: center; color: #C69548; font-size: 40px;padding-bottom: 10px;">Certificado de Conclusão</h1>
    <h2 style="text-align: center; color: #fff; font-size: 25px; padding-bottom: 20px;">Certificamos que</h2>
    <div style="width: 100vw;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    padding: 0;
    padding-bottom: 25px;">
        <p style="text-align: center; color:  #C69548; font-size: 35px; border-bottom:3px solid #fff; width: 70%; margin: 0;">$nome</p>
    </div>
    <div style="width: 100vw;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;">
        <p style="text-align: center; color: #fff; font-size: 20px; width: 50%;">Completou com sucesso o $titulo <br> da Capacitação em Gestão de Negócio</p>
    </div>
</div>
</body>
</html>
    """;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    var targetPath = appDocDir.path;
    var targetFileName = "certificado-pdf";

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
    return generatedPdfFilePath;
  }
}
