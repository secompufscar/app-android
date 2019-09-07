import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/pages/cronograma/desc_atividade.dart';
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
          return new Icon(Icons.free_breakfast, color: Colors.orange[300]);
          break;
        case Tipo.PalestraEmpresarial:
          return new Icon(Icons.business, color: Colors.indigo);
          break;
        case Tipo.FeiraProjeto:
          return new Icon(Icons.public, color: Colors.teal);
          break;
        case Tipo.PS:
          return new Icon(Icons.card_travel, color: Colors.greenAccent);
          break;
        case Tipo.Outro:
          return new Icon(Icons.memory, color: Colors.blueGrey);
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
                ]),
            new Text(
              atv.ministrantes[0].nome,
              style: new TextStyle(color: Colors.grey),
            ),
            new Row(children: <Widget>[
              Text(
                atv.inicio != null
                    ? TimeOfDay.fromDateTime(atv.inicio).format(context)
                    : " ",
                style: new TextStyle(color: Colors.grey),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    atv.local,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: new TextStyle(color: Colors.grey),
                  ),
                ),
              ),
        
              new IconButton(
                icon: Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AtividadePage(atv: atv),
                    ),
                  );
                },
              ),
            ]),
          ],
        ),
      ),
    );

    return SecompCard(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: icone,
          ),
          texto
        ],
      ),
    );
  }
}
