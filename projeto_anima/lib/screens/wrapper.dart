import 'package:flutter/material.dart';
import 'package:projeto_anima/models/user.dart';
import 'package:projeto_anima/screens/home/authenticate/authenticate.dart';
import 'package:projeto_anima/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // Retorna home ou autenticação.
    return user == null ? Authenticate() : Home();
  }
}
