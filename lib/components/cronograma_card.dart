import 'package:app_secomp/models/atividade.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'card.dart';

class CronogramaCard extends StatelessWidget {
  final Atividade atv;

  CronogramaCard({this.atv});

  

  @override
  Widget build(BuildContext context) {

    final icone = new Container(
    // secao da esquerda com o icone da atividade

    child: new Icon(Icons.flag, color: Colors.deepPurple),
  );

  final texto = new Expanded(
    // secao do meio com titulo e etc

    child: new Container(
      padding: new EdgeInsets.only(left: 8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  atv.titulo,
                  style: new TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                new Icon(Icons.star_border),
              ]),
          new Text(
            atv.ministrante.nome,
            style: new TextStyle(color: Colors.grey),
          ),
          new Row(children: <Widget>[
            Text(
              "${atv.inicio.hour}h${atv.inicio.minute}",
              style: new TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                atv.local,
                style: new TextStyle(color: Colors.grey),
              ),
            ),
            Spacer(),
            new Icon(Icons.arrow_forward_ios, size: 16),
          ]),
        ],
      ),
    ),
  );

    return SecompCard(
      child: Row(
        children: <Widget>[icone, texto],
      ),
    );
  }
}
