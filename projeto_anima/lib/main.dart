import 'package:flutter/material.dart';
import 'package:projeto_anima/models/user.dart';
import 'package:projeto_anima/screens/wrapper.dart';
import 'package:projeto_anima/service/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
