import 'package:flutter/material.dart';
import 'package:projeto_anima/util/card.dart';

class Capacitacao extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: ListView(
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
    );
  }
}
