import 'package:http/http.dart' as http;

class EmailSender {
  String perg1;
  String perg2;
  String resp1;
  String resp2;
  Map map;
  String url =
      'https://us-central1-projeto-anima-a5ba5.cloudfunctions.net/sendMail?dest=';

  EmailSender({this.perg1, this.perg2, this.resp1, this.resp2, this.map});

  sendEmail() async {
    var _list = map.values.toList();
    String nome = _list[2] + ' ' + _list[4];
    String cpf = _list[1];
    String email = _list[5];
    String body =
        'O usuário $nome com o CPF $cpf inscrito no sistema com o email $email realizou o acompanhamento' +
            ' de negócio.<p>Pergunta 1:<p> $perg1<p>$resp1<p>' +
            'Pergunta 2:<p>$perg2<p>' +
            '$resp2';
    url +=
        'animaprojetoapp@gmail.com&assunto=Aviso de Acompanhamento do Negócio&body=' +
            body;
    var res = await http.get(url);

    try {
      if (res.statusCode == 200) {
        print(res.body);
      } else {
        return null;
      }
    } on FormatException catch (e) {
      return null;
    }
  }
}
