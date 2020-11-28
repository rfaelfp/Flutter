import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_anima/models/user.dart';
import 'package:projeto_anima/service/estado_acompanhamento.dart';
import 'package:projeto_anima/util/loading.dart';
import 'package:provider/provider.dart';

class Acompanhamento extends StatefulWidget {
  @override
  _AcompanhamentoState createState() => _AcompanhamentoState();
}

class _AcompanhamentoState extends State<Acompanhamento> {
  String resposta;
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();
  EstadoAcompanhamento estado = EstadoAcompanhamento();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Container(
      child: FutureBuilder(
        future: estado.getEstadoAcompanhamento(user.uid),
        builder: (context, snapshot) {
          try {
            if (!snapshot.hasData) {
              return Center(
                child: Loading(),
              );
            } else if (snapshot.data['acompanhamento'] == false) {
              return ListView(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        'Acompanhamento',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            shadows: [
                              Shadow(blurRadius: 4.0, color: Colors.white)
                            ]),
                      ),
                    ),
                    color: const Color(0xFF363a7b),
                    height: 50.0,
                  ),
                  Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Column(
                          children: [
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua?',
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              focusNode: myFocusNode,
                              cursorColor: const Color(0xFF0098fc),
                              decoration: InputDecoration(
                                  labelText: "Resposta",
                                  labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? Colors.black
                                          : const Color(0xFF0098fc)),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          color: const Color(0xFF0098fc))),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: const Color(0xFF0098fc)),
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                              validator: (val) =>
                                  val.isEmpty ? "Preencher a resposta" : null,
                              onChanged: (val) {
                                setState(() => resposta = val);
                              },
                            )
                          ],
                        ),
                      )),
                  Center(
                    child: RaisedButton(
                        color: const Color(0xFF0098fc),
                        child: Text(
                          'Enviar',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {});
                            await estado.updateFieldAcompanhamento(user.uid);
                          }
                        }),
                  ),
                ],
              );
            } else if (snapshot.data['acompanhamento'] == true) {
              return Center(
                child: Text(
                  'O acompanhamento foi enviado. \nGentileza aguardar...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              );
            } else {
              return Center(
                child: Text('O usuário não possui essa opção.'),
              );
            }
          } catch (e) {
            return Center(
              child: Text("Ops... algo ocorreu!"),
            );
          }
        },
      ),
    );
  }
}
