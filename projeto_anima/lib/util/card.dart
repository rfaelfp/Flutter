import 'package:flutter/material.dart';
import 'package:projeto_anima/screens/certificado/certificado_view.dart';
import 'package:projeto_anima/screens/videosCapacitacao/videos_capacitacao.dart';

Container cardCapacitacao(BuildContext context, String titulo,
    String textoSecundario, String descricao, String imagem, int index) {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        side: BorderSide(color: Colors.grey[500], width: 1.5),
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/tex2.jpg'), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.playlist_play),
              title: Text(
                titulo,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.7)),
              ),
              subtitle: Text(
                textoSecundario,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Divider(
              color: Colors.grey[500],
              height: 15.0,
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
                    color: Color(0xFF57d988),
                    textColor: Colors.white,
                    splashColor: Colors.white,
                    onPressed: () async {
                      await Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return VideosCapacitacao(
                              titulo: titulo, index: index);
                        },
                      ));
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'ACESSAR CONTEÚDO',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(blurRadius: 3.0, color: Colors.white)
                            ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: FlatButton(
                    color: Color(0xFF57d988),
                    textColor: Colors.white,
                    splashColor: Colors.white,
                    onPressed: () async {
                      await Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CertificadoView();
                        },
                      ));
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'CERTIFICADO',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(blurRadius: 3.0, color: Colors.white)
                            ]),
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
      ),
    ),
  );
}
