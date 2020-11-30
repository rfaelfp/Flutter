import 'package:http/http.dart' as http;

class EmailSender {
  String perg1;
  String perg2;
  String resp1;
  String resp2;
  Map map;
  String url =
      'https://us-central1-projeto-anima-a5ba5.cloudfunctions.net/sendMail?dest=' +
          '';

  EmailSender({this.perg1, this.perg2, this.resp1, this.resp2, this.map});

  sendEmail() async {
    var _list = map.values.toList();
    String nome = _list[2];
    String sobrenome = _list[3];
    String cpf = _list[1];
    String body =
        'O usuário $nome $sobrenome com o CPF $cpf realizou o acompanhamento' +
            ' de negócio.<p>Pergunta 1:<p> $perg1<p>$resp1<p>' +
            'Pergunta 2:<p>$perg2<p>' +
            '$resp2';
    String email = _list[4];
    url += email + '&assunto=Aviso de acompanhamento do negócio&body=' + body;
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
