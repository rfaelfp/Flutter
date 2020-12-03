import 'package:cloud_firestore/cloud_firestore.dart';

class GetVideos {
  final CollectionReference videosId = Firestore.instance.collection('videos');

  Future<DocumentSnapshot> getVideosId(String nome) async {
    return await videosId.document(nome).get();
  }
}
