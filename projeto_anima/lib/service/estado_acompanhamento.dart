import 'package:cloud_firestore/cloud_firestore.dart';

class EstadoAcompanhamento {
  // Coleção do form do google
  final CollectionReference estadoAcompanhamento =
      Firestore.instance.collection('users');

  Future<DocumentSnapshot> getEstadoAcompanhamento(String uid) async {
    return await estadoAcompanhamento.document(uid).get();
  }

  Future updateFieldAcompanhamento(String uid) async {
    return await estadoAcompanhamento
        .document(uid)
        .updateData({'acompanhamento': true});
  }
}
