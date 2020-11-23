import 'package:flutter/material.dart';
import 'package:projeto_anima/screens/videosCapacitacao/videos_capacitacao.dart';
import 'package:projeto_anima/util/loading.dart';

Card cardCapacitacao(BuildContext context, String titulo,
    String textoSecundario, String descricao, String imagem, int index) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      side: BorderSide(color: Colors.grey[500], width: 0.5),
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.playlist_play),
          title: Text(titulo),
          subtitle: Text(
            textoSecundario,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        Divider(
          color: Colors.grey[500],
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            descricao,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 170,
              child: FlatButton(
                color: Colors.red[400],
                textColor: Colors.white,
                splashColor: Colors.white,
                onPressed: () async {
                  await Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return VideosCapacitacao(titulo: titulo, index: index);
                    },
                  ));
                },
                child: Text.rich(
                  TextSpan(
                    text: 'ACESSAR CONTEÚDO',
                    style: TextStyle(
                      fontSize: 14, /*decoration: TextDecoration.underline*/
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 170,
              child: FlatButton(
                color: Colors.red[400],
                textColor: Colors.white,
                splashColor: Colors.white,
                onPressed: () async {
                  await Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return VideosCapacitacao(titulo: titulo, index: index);
                    },
                  ));
                },
                child: Text.rich(
                  TextSpan(
                    text: 'CERTIFICADO',
                    style: TextStyle(
                      fontSize: 14, /*decoration: TextDecoration.underline*/
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Image.asset(
          'assets/images/' + imagem,
        ),
      ],
    ),
  );
}
