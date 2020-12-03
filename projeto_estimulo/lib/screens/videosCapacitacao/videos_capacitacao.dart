import 'package:flutter/material.dart';
import 'package:projeto_anima/service/get_videos.dart';
import 'package:projeto_anima/util/loading.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:projeto_anima/util/videos.dart';

class VideosCapacitacao extends StatefulWidget {
  final String titulo;
  final int index;
  VideosCapacitacao({this.titulo, this.index});
  @override
  _VideosCapacitacaoState createState() => _VideosCapacitacaoState();
}

class _VideosCapacitacaoState extends State<VideosCapacitacao> {
  Color c = const Color(0xFF363a7b);
  final List<String> videos = [
    'financeiro',
    'comunicacao',
    'tecnologia',
    'gestao'
  ];
  Map mapVideos;
  GetVideos getVideos = GetVideos();
  YoutubeMetaData videoMetaData;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getVideos
          .getVideosId(videos[widget.index - 1])
          .then((snapshot) => mapVideos = snapshot.data),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Loading();
        } else
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              centerTitle: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/log2.png',
                    fit: BoxFit.contain,
                    height: 26,
                  )
                ],
              ),
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        widget.titulo,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            shadows: [
                              Shadow(blurRadius: 4.0, color: Colors.white)
                            ]),
                      ),
                    ),
                    height: 50.0,
                    color: c,
                  ),
                  Column(
                    children: [
                      FutureBuilder(
                        future: widget.index == 1
                            ? addVideos(mapVideos)
                            : widget.index == 2
                                ? addVideos(mapVideos)
                                : widget.index == 3
                                    ? addVideos(mapVideos)
                                    : addVideos(mapVideos),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Container();
                          } else {
                            return snapshot.data;
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
