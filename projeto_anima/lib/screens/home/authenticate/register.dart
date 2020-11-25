import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_anima/service/auth.dart';
import 'package:projeto_anima/util/constants.dart';
import 'package:projeto_anima/util/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Estado do campo de texto
  String nome = '';
  String sobrenome = '';
  String cpf = '';
  String email = '';
  String pwd = '';
  String pwdRepeat = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.red[400],
              elevation: 0.0,
              title: Text("Registrar"),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Entrar'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/una.png'),
                    fit: BoxFit.cover),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Nome'),
                          validator: (val) =>
                              val.isEmpty ? 'Preencher o nome' : null,
                          onChanged: (val) {
                            setState(() => nome = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Sobrenome'),
                          validator: (val) =>
                              val.isEmpty ? 'Preencher e-mail!' : null,
                          onChanged: (val) {
                            setState(() => sobrenome = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11)
                          ],
                          decoration:
                              textInputDecoration.copyWith(hintText: 'CPF'),
                          validator: (val) => val.isEmpty
                              ? 'Preencher o cpf'
                              : val.length == 11 ? null : 'CPF inválido',
                          onChanged: (val) {
                            setState(() => cpf = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'E-mail'),
                          validator: (val) =>
                              val.isEmpty ? 'Preencher e-mail!' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Senha'),
                          validator: (val) => val.length < 6
                              ? 'A senha deve possuir 6 caracteres'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => pwd = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Repetir Senha'),
                          validator: (val) => val.length < 6
                              ? 'A senha deve possuir 6 caracteres'
                              : val != pwd ? 'A senha deve ser igual' : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => pwdRepeat = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          color: Colors.red[400],
                          child: Text(
                            'Registrar',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);

                              dynamic result =
                                  await _auth.regiterWithEmailAndPassword(
                                      email, pwd, nome, sobrenome, cpf);
                              print(result);
                              if (result == null) {
                                setState(() {
                                  print(_auth.erro);

                                  if (_auth.erro != null) {
                                    if (_auth.erro
                                        .contains('ERROR_INVALID_EMAIL')) {
                                      error = "O e-mail inserido é inválido!";
                                    } else {
                                      error =
                                          'Não é possível logar com as credenciais inseridas';
                                    }
                                  }
                                  loading = false;
                                });
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
