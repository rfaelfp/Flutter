import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

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
  int cont = 01;
  List<Widget> list = List<Widget>();
  for (String video in videos) {
    list.add(Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Text('#' + cont.toString() + ' Módulo Gestão Financeira',
            style: TextStyle(fontSize: 18))));
    list.add(implementsWindowVideo(implementsVideo(video)));
    cont++;
  }
  return list;
}

List<String> listDetail(dynamic detail) {
  List<String> list = new List<String>();
  list.add(detail[8]);
  list.add(detail[9]);
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

Future<dynamic> getDetail(String userUrl) async {
  String embedUrl =
      "https://noembed.com/embed?url=https://www.youtube.com/watch?v=$userUrl";

  //store http request response to res variable
  var res = await http.get(embedUrl);
  print("get youtube detail status code: " + res.statusCode.toString());

  try {
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      data = listDetail(data);
      return data;
    } else {
      //return null if status code other than 200
      return null;
    }
  } on FormatException catch (e) {
    print('invalid JSON' + e.toString());
    //return null if error
    return null;
  }
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
