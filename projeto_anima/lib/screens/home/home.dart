import 'package:flutter/material.dart';
import 'package:projeto_anima/service/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Início"),
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Sair'))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red[400],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        elevation: 2.0,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text("Mentoria")),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), title: Text("Capacitação")),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), title: Text("Acompanhamento")),
        ],
      ),
    );
  }
}
