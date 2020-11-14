import 'package:flutter/material.dart';
import 'package:projeto_anima/util/card.dart';

class Capacitacao extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          cardCapacitacao(
              context,
              'Módulo Financeiro',
              'Capacitação em Gestão de Negócio',
              'Descrição do Curso.',
              'modulo_financeiro.png'),
          cardCapacitacao(
              context,
              'Módulo Comunicação e Marketing',
              'Capacitação em Gestão de Negócio',
              'Descrição do Curso',
              'modulo_comunicacao.png'),
          cardCapacitacao(
              context,
              'Módulo Tecnologia e Inovação',
              'Capacitação em Gestão de Negócio',
              'Descrição do Curso',
              'modulo_tecnologia.jpg'),
          cardCapacitacao(
              context,
              'Módulo Gestão de RH',
              'Capacitação em Gestão de Negócio',
              'Descrição do Curso',
              'modulo_gestao.png'),
        ],
      ),
    );
  }
}
