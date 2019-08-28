import 'package:app_secomp/models/atividade.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'card.dart';

class CronogramaCard extends StatelessWidget {
  final Atividade atv;

  CronogramaCard({this.atv});

  @override
  Widget build(BuildContext context) {
    Widget getTipo() {
      switch (atv.tipo) {
        case Tipo.Palestra:
          return new Icon(Icons.timeline, color: Colors.deepPurple);
          break;
        case Tipo.Minicurso:
          return new Icon(Icons.attach_file, color: Colors.green);
          break;
        case Tipo.Workshop:
          return new Icon(Icons.alternate_email, color: Colors.blue);
          break;
        case Tipo.MesaRedonda:
          return new Icon(Icons.supervisor_account, color: Colors.lightBlue);
          break;
        case Tipo.Coffee:
          return new Icon(Icons.opacity, color: Colors.orange[300]);
          break;
        case Tipo.Institucional:
          return new Icon(Icons.flag, color: Colors.greenAccent);
          break;
        default:
          return Container();
      }
    }

    final icone = new Container(
        // secao da esquerda com o icone da atividade

        child: getTipo());

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
                  Flexible(
                    child: Text(
                      atv.titulo,
                      style: new TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
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
