import 'package:app_secomp/components/cronograma_card.dart';
import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/models/ministrante.dart';
import 'package:app_secomp/pages/cronograma/bloc_cronograma.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class Cronograma extends StatelessWidget {
  // final List<Atividade> listaAtv = [
  //   Atividade(
  //       Tipo.Institucional,
  //       "Credenciamento",
  //       Ministrante("Secomp UFSCar", "Secomp", "UFSCar"),
  //       DateTime(2019, 09, 10, 8, 0),
  //       DateTime(2019, 09, 10, 9, 0),
  //       "Anfiteatro Bento Prado Jr.",
  //       "descricao"),
  //   Atividade(
  //       Tipo.Institucional,
  //       "Abertura",
  //       Ministrante("Secomp UFSCar", "Secomp", "UFSCar"),
  //       DateTime(2019, 09, 10, 9, 0),
  //       DateTime(2019, 09, 10, 10, 0),
  //       "Anfiteatro Bento Prado Jr.",
  //       "descricao"),
  //   Atividade(
  //       Tipo.Palestra,
  //       "Crimes Digitais e Computação Forense",
  //       Ministrante("Vaine Luiz Barreira", "Professor", "UFSCar"),
  //       DateTime(2019, 09, 10, 10, 0),
  //       DateTime(2019, 09, 10, 11, 0),
  //       "Anfiteatro Bento Prado Jr.",
  //       "descricao"),
  //   Atividade(
  //       Tipo.Palestra,
  //       "Homem x Máquina: o impacto da Inteligência Artificial na saúde",
  //       Ministrante("Michel Silva Fornaciali", "Professor", "UFSCar"),
  //       DateTime(2019, 09, 10, 11, 0),
  //       DateTime(2019, 09, 10, 12, 0),
  //       "Anfiteatro Bento Prado Jr.",
  //       "descricao"),
  //   Atividade(
  //       Tipo.Coffee,
  //       "Coffee-break",
  //       Ministrante("","",""),
  //       DateTime(2019, 09, 10, 12, 0),
  //       DateTime(2019, 09, 10, 12, 30),
  //       "Anfiteatro Bento Prado Jr. - anexo",
  //       "descricao"),
  //   Atividade(
  //       Tipo.Workshop,
  //       "Workshop Roi Hero",
  //       Ministrante("Paulo Waib Castello Branco", "Professor", "UFSCar"),
  //       DateTime(2019, 09, 10, 12, 30),
  //       DateTime(2019, 09, 10, 14, 0),
  //       "Anfiteatro Bento Prado Jr.",
  //       "descricao"),
  // ];

  // Widget _buildListAtividades(int index) {
  //   return CronogramaCard(atv: listaAtv[index]);
  // }

  final BlocCronograma bloc = BlocProvider.getBloc<BlocCronograma>();

  Widget _buildListAtividades(int index, List<Atividade> list) {
    return CronogramaCard(atv: list[index]);
  }

  @override
  Widget build(BuildContext context) {

    bloc.fetchAtividades();

    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            "(navbar do cronograma)",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        StreamBuilder(
          stream: bloc.outAtividades,
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildListAtividades(index, snapshot.data),
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}
