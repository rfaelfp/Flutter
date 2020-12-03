import 'package:flutter/material.dart';
import 'package:projeto_anima/service/auth.dart';
import 'package:projeto_anima/util/constants.dart';
import 'package:projeto_anima/util/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // Estado do campo de texto
  String email = '';
  String pwd = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Registrar'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 0, 5),
                  width: 170.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/log.png'),
                        fit: BoxFit.contain),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
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
                        SizedBox(
                          width: 150.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: const Color(0xFF0098fc),
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth
                                    .signInWithEmailAndPassword(email, pwd);
                                print('válido');
                                if (result == null) {
                                  setState(() {
                                    print(_auth.erro);
                                    if (_auth.erro != null) {
                                      if (_auth.erro
                                          .contains('ERROR_INVALID_EMAIL')) {
                                        error = "O e-mail inserido é inválido!";
                                      } else if (_auth.erro
                                          .contains('ERROR_WRONG_PASSWORD')) {
                                        error =
                                            'A senha ou o e-mail foi digitado incorretamente';
                                      } else if (_auth.erro
                                          .contains('ERROR_USER_NOT_FOUND')) {
                                        error = 'Usuário não cadastrado.';
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
                ),
              ]),
            ),
          );
  }
}
