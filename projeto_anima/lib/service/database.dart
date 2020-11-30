import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_anima/service/auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  AuthService auth;

  // Coleção de referência
  final CollectionReference newUserCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String nome, String sobrenome, String cpf, String email,
      bool acompanhamento) async {
    return await newUserCollection.document(uid).setData({
      'nome': nome,
      'sobrenome': sobrenome,
      'cpf': cpf,
      'email': email,
      'acompanhamento': acompanhamento,
    });
  }

  Future<DocumentSnapshot> getUserData(String uid) async {
    return await newUserCollection.document(uid).get();
  }
}
