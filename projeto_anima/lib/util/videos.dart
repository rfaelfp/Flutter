import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

YoutubePlayerController implementsVideo(String idVideo) {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: idVideo, // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ));
  return _controller;
}

YoutubePlayer implementsWindowVideo(dynamic _controller) {
  return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red[400]);
}

List<String> videosModuloFinanceiro = [
  '5RKu-87zTOw',
  '5RKu-87zTOw',
  '5RKu-87zTOw',
  '5RKu-87zTOw'
];
List<String> videosModuloComunicacao = [
  'giONDI-shl0',
  'giONDI-shl0',
  'giONDI-shl0'
];
List<String> videosModuloTecnologia = [
  'Ou0ceDK492w',
  'Ou0ceDK492w',
  'Ou0ceDK492w',
  'Ou0ceDK492w'
];
List<String> videosModuloGestao = [
  'vqAgbGQRw0A',
  'vqAgbGQRw0A',
  'vqAgbGQRw0A',
  'vqAgbGQRw0A'
];

dynamic videosFinanceiros() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        implementsWindowVideo(implementsVideo(videosModuloFinanceiro[0])),
        Divider(),
        implementsWindowVideo(implementsVideo(videosModuloFinanceiro[1])),
        Divider(),
        implementsWindowVideo(implementsVideo(videosModuloFinanceiro[2])),
        Divider(),
        implementsWindowVideo(implementsVideo(videosModuloFinanceiro[3])),
        Divider(),
      ],
    ),
  );
}

dynamic videosComunicacao() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        implementsWindowVideo(implementsVideo(videosModuloComunicacao[0])),
        implementsWindowVideo(implementsVideo(videosModuloComunicacao[1])),
        implementsWindowVideo(implementsVideo(videosModuloComunicacao[2])),
      ],
    ),
  );
}

dynamic videosTecnologia() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        implementsWindowVideo(implementsVideo(videosModuloTecnologia[0])),
        implementsWindowVideo(implementsVideo(videosModuloTecnologia[1])),
        implementsWindowVideo(implementsVideo(videosModuloTecnologia[2])),
        implementsWindowVideo(implementsVideo(videosModuloTecnologia[3])),
      ],
    ),
  );
}

dynamic videosGestao() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        implementsWindowVideo(implementsVideo(videosModuloGestao[0])),
        implementsWindowVideo(implementsVideo(videosModuloGestao[1])),
        implementsWindowVideo(implementsVideo(videosModuloGestao[2])),
        implementsWindowVideo(implementsVideo(videosModuloGestao[3])),
      ],
    ),
  );
}
