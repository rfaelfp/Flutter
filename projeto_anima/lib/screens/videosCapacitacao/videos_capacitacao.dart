import 'package:flutter/material.dart';
import 'package:projeto_anima/service/auth.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:projeto_anima/util/videos.dart';

class VideosCapacitacao extends StatefulWidget {
  final String titulo;
  int index;
  VideosCapacitacao({this.titulo, this.index});
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
      body: widget.index == 1
          ? videosFinanceiros()
          : widget.index == 2
              ? videosComunicacao()
              : widget.index == 3 ? videosTecnologia() : videosGestao(),
    );
  }
}