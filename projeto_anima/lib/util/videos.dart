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
    progressIndicatorColor: Colors.red[400],
  );
}

List<Widget> addWidgetList(List<String> videos) {
  int cont = 01;
  List<Widget> list = List<Widget>();
  for (String video in videos) {
    list.add(
      Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            side: BorderSide(color: Colors.grey[500], width: 1.5)),
        child: Column(
          children: [
            Text(
              'Vídeo ' + cont.toString(),
              textAlign: TextAlign.start,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: implementsWindowVideo(
                implementsVideo(video),
              ),
            ),
          ],
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
        Text(getDetail('5RKu-87zTOw').toString()),
      ],
    ),
  );
}

Future<List> getDetail(String userUrl) async {
  List<String> list;
  String autor;
  String embedUrl =
      "https://noembed.com/embed?url=https://www.youtube.com/watch?v=$userUrl";

  //store http request response to res variable
  var res = await http.get(embedUrl);
  print("get youtube detail status code: " + res.statusCode.toString());

  try {
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      autor = data['author_name'];
      list.add(autor);
      return list;
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
