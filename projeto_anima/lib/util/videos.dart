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
      progressIndicatorColor: Colors.red[400]);
}

List<Widget> addWidgetList(List<String> videos) {
  int cont = 1;
  List<Widget> list = List<Widget>();
  for (String video in videos) {
    list.add(Divider());
    list.add(Text('Aula ' + cont.toString()));
    list.add(implementsWindowVideo(implementsVideo(video)));
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
      ],
    ),
  );
}

List<String> listModuloFinanceiro = [
  '5RKu-87zTOw',
  '5RKu-87zTOw',
  '5RKu-87zTOw',
  '5RKu-87zTOw'
];
List<String> listModuloComunicacao = [
  'giONDI-shl0',
  'giONDI-shl0',
  'giONDI-shl0'
];
List<String> listModuloTecnologia = [
  'Ou0ceDK492w',
  'Ou0ceDK492w',
  'Ou0ceDK492w',
  'Ou0ceDK492w'
];
List<String> listModuloGestao = [
  'vqAgbGQRw0A',
  'vqAgbGQRw0A',
  'vqAgbGQRw0A',
  'vqAgbGQRw0A'
];
