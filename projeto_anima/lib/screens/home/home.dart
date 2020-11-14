import 'package:flutter/material.dart';
import 'package:projeto_anima/service/auth.dart';
import 'package:projeto_anima/screens/newpagescreen/newpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int indiceAtual = 1;
  final List<Widget> _telas = [
    NewPageScreen(0),
    NewPageScreen(1),
    NewPageScreen(2)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: indiceAtual == 0
            ? Text('Mentoria Específica')
            : indiceAtual == 1
                ? Text('Capacitação Geral')
                : Text('Acompanhemento do Negócio'),
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
      body: _telas[indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red[400],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        elevation: 2.0,
        currentIndex: indiceAtual,
        onTap: onTabTapped,
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

  void onTabTapped(int index) {
    setState(() {
      indiceAtual = index;
    });
  }
}
