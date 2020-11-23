import 'package:flutter/material.dart';
import 'package:projeto_anima/service/auth.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:projeto_anima/util/videos.dart';

class VideosCapacitacao extends StatefulWidget {
  YoutubeMetaData videoMetaData;
  final String titulo;
  final int index;
  VideosCapacitacao({this.titulo, this.index});
  @override
  _VideosCapacitacaoState createState() => _VideosCapacitacaoState();
}

class _VideosCapacitacaoState extends State<VideosCapacitacao> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Colors.red[400],
        elevation: 0.0,
      ),
      body: widget.index == 1
          ? addVideos(listModuloFinanceiro)
          : widget.index == 2
              ? addVideos(listModuloComunicacao)
              : widget.index == 3
                  ? addVideos(listModuloTecnologia)
                  : addVideos(listModuloGestao),
    );
  }
}
