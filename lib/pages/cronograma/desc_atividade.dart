import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../../components/ministrante_card.dart';
import '../../models/atividade.dart';
import '../../models/ministrante.dart';

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
        case TipoAtividade.Palestra:
          return "Palestra";
          break;
        case TipoAtividade.Minicurso:
          return "Minicurso";
          break;
        case TipoAtividade.Workshop:
          return "Workshop";
          break;
        case TipoAtividade.MesaRedonda:
          return "Mesa-redonda";
          break;
        case TipoAtividade.Coffee:
          return "Coffee-break";
          break;
        case TipoAtividade.PS:
          return "Processo Seletivo";
          break;
        case TipoAtividade.FeiraProjeto:
          return "Feira de Projetos";
          break;
        case TipoAtividade.PalestraEmpresarial:
          return "Palestra Empresarial";
          break;
        default:
          return "Atividade";
      }
    }

    return Scaffold(
      appBar: GradientAppBar(title: Text(getTipoAtividade())),
      body: Material(
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                atv.descricao,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  height: 1.25,
                  fontSize: 16,
                ),
              ),
            ),
            new Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  atv.inicio != null
                      ? TimeOfDay.fromDateTime(atv.inicio).format(context)
                      : " ",
                  style: new TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  atv.local,
                  style: new TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Ministrante(s)",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            new ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: atv.ministrantes.length,
                itemBuilder: (BuildContext ctxt, int index) =>
                    _buildMinistrante(atv.ministrantes[index])),
          ],
        ),
      ),
    );
  }
}
