import 'package:flutter/material.dart';
import 'package:projeto_anima/util/card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Capacitacao extends StatefulWidget {
  @override
  _CapacitacaoState createState() => _CapacitacaoState();
}

class _CapacitacaoState extends State<Capacitacao> {
  final keyLoad = 'loaded';
  Widget build(BuildContext context) {
    SharedPreferences.setMockInitialValues({});
    //Future.delayed(Duration.zero, () => _showAlert(context));
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: Container(
        child: ListView(
          children: [
            cardCapacitacao(
                context,
                'Módulo Financeiro',
                'Capacitação em Gestão de Negócio',
                'Descrição do Curso.',
                'modulo_financeiro.png',
                1),
            cardCapacitacao(
                context,
                'Módulo Comunicação e Marketing',
                'Capacitação em Gestão de Negócio',
                'Descrição do Curso',
                'modulo_comunicacao.png',
                2),
            cardCapacitacao(
                context,
                'Módulo Tecnologia e Inovação',
                'Capacitação em Gestão de Negócio',
                'Descrição do Curso',
                'modulo_tecnologia.jpg',
                3),
            cardCapacitacao(
                context,
                'Módulo Gestão de RH',
                'Capacitação em Gestão de Negócio',
                'Descrição do Curso',
                'modulo_gestao.png',
                4),
          ],
        ),
      ),
    );
  }

  _showAlert(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstLoad = prefs.getBool(keyLoad);
    if (firstLoad == null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                title: Text(
                  "Acompanhamento do Negócio",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: Text(
                    'Gentileza acessar a opção acompanhamento e responder o questionário.'),
                actions: [
                  FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      prefs.setBool(keyLoad, false);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
    }
  }
}
