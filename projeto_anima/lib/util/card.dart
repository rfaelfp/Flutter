import 'package:flutter/material.dart';
import 'package:projeto_anima/screens/videosCapacitacao/videos_capacitacao.dart';
import 'package:projeto_anima/util/loading.dart';

Card cardCapacitacao(BuildContext context, String titulo,
    String textoSecundario, String descricao, String imagem, int index) {
  return Card(
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            descricao,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            FlatButton(
              textColor: const Color(0xFF6200EE),
              onPressed: () async {
                await Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return VideosCapacitacao(titulo: titulo, index: index);
                  },
                ));
              },
              child: const Text('ACESSAR CONTEÚDO'),
            ),
          ],
        ),
        Image.asset(
          'assets/images/' + imagem,
          height: 250.0,
          width: 1000.0,
        ),
      ],
    ),
  );
}
