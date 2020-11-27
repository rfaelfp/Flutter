import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_anima/models/user.dart';
import 'package:projeto_anima/service/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String erro;

  // Método para criar objeto baseado no FireBaseUser
  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Método para verificar alteração no stream do usuário
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFireBaseUser(user));
  }

  // Método para logar anónimo
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Método para logar com e-mail e senha

  Future signInWithEmailAndPassword(String email, String pwd) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: pwd); // esse método é do firebase
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      erro = e.toString();
      print(e.toString());
      return null;
    }
  }

  // Método para registrar com login e senha

  Future regiterWithEmailAndPassword(String email, String pwd, String nome,
      String sobrenome, String cpf, bool acompanhamento) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          // esse método é do firebase
          email: email,
          password: pwd);
      FirebaseUser user = result.user;
      // realiza a criação da coleção no cloud firestore com a uid.
      await DatabaseService(uid: user.uid)
          .updateUserData(nome, sobrenome, cpf, email, acompanhamento);
      return _userFromFireBaseUser(user);
    } catch (e) {
      erro = e.toString();
      return null;
    }
  }

  // Método para deslogar
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
