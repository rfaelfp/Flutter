import 'package:flutter/material.dart';
import 'package:projeto_anima/util/card.dart';

class Capacitacao extends StatefulWidget {
  @override
  _CapacitacaoState createState() => _CapacitacaoState();
}

class _CapacitacaoState extends State<Capacitacao> {
  Color c = const Color(0xFF363a7b);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Center(
                child: Text(
                  'Capacitação Geral',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      shadows: [Shadow(blurRadius: 4.0, color: Colors.white)]),
                ),
              ),
              color: c,
              height: 50.0,
            ),
            cardCapacitacao(
                context,
                'Módulo Financeiro',
                'Capacitação em Gestão de Negócio',
                'Descrição do Curso.',
                'fin2.jpg',
                1),
            cardCapacitacao(
                context,
                'Módulo Comunicação e Marketing',
                'Capacitação em Gestão de Negócio',
                'Descrição do Curso',
                'com.jpg',
                2),
            cardCapacitacao(
                context,
                'Módulo Tecnologia e Inovação',
                'Capacitação em Gestão de Negócio',
                'Descrição do Curso',
                'tec.jpeg',
                3),
            cardCapacitacao(
                context,
                'Módulo Gestão de RH',
                'Capacitação em Gestão de Negócio',
                'Descrição do Curso',
                'ges.jpg',
                4),
          ],
        ),
      ),
    );
  }
}
