import 'package:app_secomp/components/ministrante_card.dart';
import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/models/ministrante.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AtividadePage extends StatelessWidget {
  final Atividade atv;

  const AtividadePage({this.atv});

  @override
  Widget build(BuildContext context) {
    Widget _buildMinistrante(Ministrante min) {
      return MinistranteCard(min: min);
    }

    String getTipoAtividade() {
      switch (atv.tipo) {
        case Tipo.Palestra:
          return "Palestra";
          break;
        case Tipo.Minicurso:
          return "Minicurso";
          break;
        case Tipo.Workshop:
          return "Workshop";
          break;
        case Tipo.MesaRedonda:
          return "Mesa-redonda";
          break;
        case Tipo.Coffee:
          return "Coffee-break";
          break;
        case Tipo.Institucional:
          return "Instituicional";
          break;
        default:
          return "Atividade";
      }
    }

    return Scaffold(
      appBar: GradientAppBar(title: Text(getTipoAtividade())),
      body: Material(
        color: Colors.white,
        child: ListView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            atv.titulo,
                            style: TextStyle(fontSize: 24),
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                        new ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: atv.ministrantes.length,
                            itemBuilder: (BuildContext ctxt, int index) =>
                                _buildMinistrante(atv.ministrantes[index])),
                        new Row(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              atv.inicio != null
                                  ? TimeOfDay.fromDateTime(atv.inicio)
                                      .format(context)
                                  : " ",
                              style: new TextStyle(color: Colors.grey),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              atv.local,
                              style: new TextStyle(color: Colors.grey),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Descrição",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Text(
                atv.descricao,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
