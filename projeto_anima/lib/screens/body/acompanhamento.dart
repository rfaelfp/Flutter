import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_anima/models/user.dart';
import 'package:projeto_anima/service/database.dart';
import 'package:projeto_anima/service/email_sender.dart';
import 'package:projeto_anima/service/estado_acompanhamento.dart';
import 'package:projeto_anima/util/loading.dart';
import 'package:provider/provider.dart';

class Acompanhamento extends StatefulWidget {
  @override
  _AcompanhamentoState createState() => _AcompanhamentoState();
}

class _AcompanhamentoState extends State<Acompanhamento> {
  DatabaseService data = DatabaseService();
  Map map = Map();
  String resp1;
  String resp2;
  String perg1 =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua?';
  String perg2 = 'Qual o faturamento no período?';
  final _formKey = GlobalKey<FormState>();
  EstadoAcompanhamento estado = EstadoAcompanhamento();
  DateTime dataAtual = DateTime.now();

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
                          vertical: 15.0, horizontal: 15.0),
                      child: Column(
                        children: [
                          Text(
                            perg1,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            cursorColor: const Color(0xFF0098fc),
                            decoration: InputDecoration(
                                labelText: "Resposta",
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: const Color(0xFF0098fc))),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color(0xFF0098fc)),
                                    borderRadius: BorderRadius.circular(20.0))),
                            keyboardType: TextInputType.multiline,
                            maxLines: 10,
                            validator: (val) =>
                                val.isEmpty ? "Preencher a resposta" : null,
                            onChanged: (val) {
                              setState(() => resp1 = val);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 15),
                            child: Row(
                              children: [
                                Text(
                                  perg2,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            cursorColor: const Color(0xFF0098fc),
                            decoration: InputDecoration(
                                labelText: 'Valor',
                                labelStyle: TextStyle(color: Colors.black),
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: const Color(0xFF0098fc))),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color(0xFF0098fc)),
                                    borderRadius: BorderRadius.circular(20.0))),
                            validator: (val) =>
                                val.isEmpty ? "Preencher a resposta" : null,
                            onChanged: (val) {
                              setState(() => resp2 = val);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                        color: const Color(0xFF0098fc),
                        child: Text(
                          'Enviar',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await data
                                .getUserData(user.uid)
                                .then((value) => map = value.data);
                            EmailSender email = EmailSender(
                                perg1: perg1,
                                perg2: perg2,
                                resp1: resp1,
                                resp2: resp2,
                                map: map);
                            email.sendEmail();
                            await estado.updateFieldAcompanhamento(user.uid);
                            await estado.updateFieldDataAcompanhamento(
                                user.uid, dataAtual);
                            setState(() {});
                          }
                        }),
                  ),
                ],
              );
            } else if (snapshot.data['acompanhamento'] == true) {
              DateTime dataEnvioAcompanhamento =
                  snapshot.data['data acompanhamento'].toDate();
              var dataSeisMesesFuturo =
                  dataEnvioAcompanhamento.add(new Duration(seconds: 15778800));
              int dias =
                  dataSeisMesesFuturo.difference(dataAtual).inDays.toInt();
              if (dias <= 0) {
                setState(() async {
                  await estado.updateFieldAcompanhamentoFalse(user.uid);
                  setState(() {});
                });
              } else {
                return Column(
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
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'O acompanhamento foi enviado.\nUm novo acompanhamento deve ser enviado em',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              dataSeisMesesFuturo
                                  .difference(dataAtual)
                                  .inDays
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 120),
                            ),
                            Text(
                              'dias',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            } else {
              return Center(
                child: Text('O usuário não tem essa opção!'),
              );
            }
          } catch (e) {
            return Center(
              child: Text('...'),
            );
          }
        },
      ),
    );
  }
}
