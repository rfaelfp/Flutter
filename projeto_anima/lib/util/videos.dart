import 'package:flutter/material.dart';
import 'package:projeto_anima/util/info_videos.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

YoutubePlayerController implementsVideo(String idVideo) {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: idVideo, // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: false,
      ));

  return _controller;
}

YoutubePlayer implementsWindowVideo(dynamic _controller) {
  return YoutubePlayer(
    controller: _controller,
    showVideoProgressIndicator: true,
    progressIndicatorColor: Colors.red[400],
  );
}

List<Widget> addWidgetList(List<String> videos) {
  InfoVideo infoVideo = InfoVideo();
  List<Widget> list = List<Widget>();
  for (String video in videos) {
    list.add(
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 27.0,
                  spreadRadius: 7.0,
                  offset: Offset(0, 0)),
            ]),
        child: Card(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(color: Colors.grey[500], width: 1.5)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 8, 0, 0),
                child: FutureBuilder(
                  future: infoVideo.preencheLista(video),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    } else {
                      return Text(
                        snapshot.data['title'] +
                            '\n' +
                            snapshot.data['author_name'],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      );
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
                child: implementsWindowVideo(
                  implementsVideo(video),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  return list;
}

dynamic addVideos(List<String> links) {
  List<Widget> videos = addWidgetList(links);
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (Widget video in videos) video,
      ],
    ),
  );
}

final List<String> listModuloFinanceiro = [
  '8jjlGq86PHo',
  's5pb8YLaVXA',
  '09kssWxWbVY',
  'xMqCZSy1yU4'
];
final List<String> listModuloComunicacao = [
  'giONDI-shl0',
  'giONDI-shl0',
  'giONDI-shl0'
];
final List<String> listModuloTecnologia = [
  'Ou0ceDK492w',
  'Ou0ceDK492w',
  'Ou0ceDK492w',
  'Ou0ceDK492w'
];
final List<String> listModuloGestao = [
  'vqAgbGQRw0A',
  'vqAgbGQRw0A',
  'vqAgbGQRw0A',
  'vqAgbGQRw0A'
];
