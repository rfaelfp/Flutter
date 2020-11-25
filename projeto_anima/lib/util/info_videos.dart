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

    //store http request response to res variable
    var res = await http.get(embedUrl);
    print("get youtube detail status code: " + res.statusCode.toString());

    try {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        for (Map<String, dynamic> obj in data) {
          title = obj[8];
          autor = obj[9];
        }
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

  void preencheList(List list) async {
    for (var i = 0; i < list.length; i++) {
      dynamic info = await getDetail(list[i]);
      list.add(info);
    }
  }
}
