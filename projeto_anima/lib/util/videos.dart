import 'package:flutter/material.dart';
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
  int cont = 01;
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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(color: Colors.grey[500], width: 0.5)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Text(
                'Vídeo ' + cont.toString(),
                textAlign: TextAlign.start,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: implementsWindowVideo(
                  implementsVideo(video),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    cont++;
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
        Text('Teste'),
      ],
    ),
  );
}

final List<String> listModuloFinanceiro = [
  '5RKu-87zTOw',
  '5RKu-87zTOw',
  '5RKu-87zTOw',
  '5RKu-87zTOw'
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
