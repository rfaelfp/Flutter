import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Coleção de referência
  final CollectionReference newUserCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String nome, String sobrenome, String cpf, String email) async {
    return await newUserCollection.document(uid).setData({
      'nome': nome,
      'sobrenome': sobrenome,
      'cpf': cpf,
      'email': email,
    });
  }
}
