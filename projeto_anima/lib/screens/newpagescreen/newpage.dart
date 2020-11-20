import 'package:flutter/material.dart';
import 'package:projeto_anima/screens/body/capacitacao/capacitacao.dart';
import 'package:projeto_anima/screens/body/mentoria.dart';

class NewPageScreen extends StatelessWidget {
  final int index;

  NewPageScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return index == 0
        ? Mentoria()
        : index == 1 ? Capacitacao() : Text('teste2');
  }
}
