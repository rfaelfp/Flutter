import 'package:cloud_firestore/cloud_firestore.dart';

class UrlForm {
  static dynamic url = '';
  // Coleção do form do google
  final CollectionReference urlForm = Firestore.instance.collection('form');

  Future getUrlForm() async {
    return urlForm
        .getDocuments()
        .then((value) => value.documents[0].data['urlForm']);
  }

  void main() async {
    url = await getUrlForm();
  }
}
