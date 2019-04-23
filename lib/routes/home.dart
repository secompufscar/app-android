import 'package:flutter/material.dart';
import 'package:app_secomp/components/noticia_card.dart';
import 'package:app_secomp/models/noticia.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Widget body = HomePage();

  @override
  Widget build(BuildContext context) {

    final List<Noticia> noticias = [
      Noticia("Não percam a melhor SECOMP!!! #MelhorSECOMP #XSECOMP",
          "segundos atras"),
      Noticia(
          "Essa é a segunda nótica. É um pouco mais longa. Tem mais linha do que a primeira, como vocês podem ver. Preciso adicionar mais caracteres pra ficar mais longa.",
          "2h atras"),
      Noticia("Só pra não ter só duas notícias", "17/04/2019"),
    ];

    Widget _buildListNoticias(int index) {
      return NoticiaCard(
        content: noticias[index].content,
        date: noticias[index].date,
      );
    }

    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            "Notícias",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: noticias.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildListNoticias(index),
        ),
      ],
    );
  }
}
