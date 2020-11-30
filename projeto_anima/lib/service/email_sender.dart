import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_anima/service/database.dart';

class EmailSender {
  String perg1;
  String perg2;
  String resp1;
  String resp2;
  String url =
      'https://us-central1-projeto-anima-a5ba5.cloudfunctions.net/sendMail?' +
          '';

  EmailSender({this.perg1, this.perg2, this.resp1, this.resp2});

  sendEmail() async {
    await http.get(url);
  }
}
