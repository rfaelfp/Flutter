import 'dart:io';

import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';

class Certificado {
  String generatedPdfFilePath;
  Future<String> generateExampleDocument() async {
    var htmlContent = """
    <!DOCTYPE html>
<html>
   <head>
      <style>
         table, th, td {
         border: 1px solid black;
         border-collapse: collapse;
         }
         th, td, p {
         padding: 5px;
         text-align: left;
         }
      </style>
   </head>
   <body>
      <div style="width:800px; height:600px; padding:20px; text-align:center; border: 10px solid #787878">
         <div style="width:750px; height:550px; padding:20px; text-align:center; border: 5px solid #787878">
            <span style="font-size:50px; font-weight:bold">Certificado de Conclusão</span>
            <br><br>
            <span style="font-size:25px"><i>This is to certify that</i></span>
            <br><br>
            <span style="font-size:30px"><b></b></span><br/><br/>
            <span style="font-size:25px"><i>has completed the course</i></span> <br/><br/>
            <span style="font-size:30px"></span> <br/><br/>
            <span style="font-size:20px">with score of <b></b></span> <br/><br/><br/><br/>
            <span style="font-size:25px"><i>dated</i></span><br>
            <span style="font-size:30px"></span>
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
