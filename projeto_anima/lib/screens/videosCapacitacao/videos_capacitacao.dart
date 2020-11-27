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
  Map mapVideos;
  GetVideos getVideos = GetVideos();
  YoutubeMetaData videoMetaData;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getVideos
          .getVideosId('financeiro')
          .then((snapshot) => mapVideos = snapshot.data),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Loading();
        } else
          return Scaffold(
            backgroundColor: Colors.red[50],
            appBar: AppBar(
              title: Text(widget.titulo),
              backgroundColor: Colors.red[400],
              elevation: 0.0,
            ),
            body: FutureBuilder(
              future: widget.index == 1
                  ? addVideos(mapVideos)
                  : widget.index == 2
                      ? addVideos(mapVideos)
                      : widget.index == 3
                          ? addVideos(mapVideos)
                          : addVideos(mapVideos),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Loading();
                } else {
                  return snapshot.data;
                }
              },
            ),
          );
      },
    );
  }
}
