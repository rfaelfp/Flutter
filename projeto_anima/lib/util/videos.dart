import 'package:flutter/material.dart';
import 'package:projeto_anima/service/info_videos.dart';
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

List<Widget> addWidgetList(Map map) {
  List videos = List();
  map.forEach((key, value) {
    videos.add(value.toString());
  });
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
          semanticContainer: true,
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/tex5.jpg'),
                  fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 8, 0, 15),
                  child: FutureBuilder(
                    future: infoVideo.preencheLista(video),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          child: Text('Carregando...'),
                          alignment: Alignment.center,
                        );
                      } else {
                        return Column(
                          children: [
                            Center(
                              child: Text(
                                snapshot.data['title'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                snapshot.data['author_name'],
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        );
                      }
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: implementsWindowVideo(
                    implementsVideo(video),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  return list;
}

Future addVideos(Map links) async {
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
