import 'package:app_secomp/components/card.dart';
import 'package:app_secomp/components/cronograma_card.dart';
import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/models/ministrante.dart';
import 'package:flutter/material.dart';

class Cronograma extends StatefulWidget {
  @override
  _CronogramaState createState() => _CronogramaState();
}

class _CronogramaState extends State<Cronograma> {
  final List<Atividade> listaAtv = [
    Atividade(
        "Hackeando urna eletrônica",
        Ministrante("Paulo Matias", "Professor", "UFSCar"),
        DateTime.now(),
        DateTime.now(),
        "Anfiteatro Bento Prado Jr.",
        "descricao")
  ];

  Widget _buildListAtividades(int index) {
    return CronogramaCard(atv: listaAtv[index]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            "Cronograma",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: listaAtv.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildListAtividades(index),
        ),
      ],
    );
  }
}
