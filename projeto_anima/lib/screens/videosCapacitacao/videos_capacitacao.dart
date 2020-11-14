import 'package:flutter/material.dart';
import 'package:projeto_anima/service/auth.dart';

class VideosCapacitacao extends StatefulWidget {
  final String titulo;
  VideosCapacitacao({this.titulo});
  @override
  _VideosCapacitacaoState createState() => _VideosCapacitacaoState();
}

class _VideosCapacitacaoState extends State<VideosCapacitacao> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Colors.red[400],
        elevation: 0.0,
      ),
    );
  }
}
