import 'dart:convert';
import 'package:http/http.dart' as http;

class InfoVideo {
  String title;
  String autor;
  List list;

  InfoVideo({this.title, this.autor, this.list});

  factory InfoVideo.fromJson(Map<String, dynamic> parsedJson) {
    return InfoVideo(
        autor: parsedJson['author_name'], title: parsedJson['title']);
  }

  Future getDetail(String userUrl) async {
    String embedUrl =
        "https://noembed.com/embed?url=https://www.youtube.com/watch?v=$userUrl";

    var res = await http.get(embedUrl);
    print("get youtube detail status code: " + res.statusCode.toString());

    try {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        return data;
      } else {
        return null;
      }
    } on FormatException catch (e) {
      print('invalid JSON' + e.toString());
      return null;
    }
  }

  Future preencheLista(String video) async {
    dynamic data = await getDetail(video);
    return data;
  }
}
