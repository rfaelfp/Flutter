import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // Coleção de referência
  final CollectionReference newUserCollection =
      Firestore.instance.collection('users');
}
