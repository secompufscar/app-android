import 'package:app_secomp/colors.dart';
import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/models/ministrante.dart';
import 'package:app_secomp/pages/cronograma/bloc_cronograma.dart';
import 'package:app_secomp/pages/cronograma/list_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';


class Cronograma extends StatelessWidget {
  static final List<Atividade> listaAtv = [
    Atividade(
        tipo: Tipo.Institucional,
        titulo: "Credenciamento",
        ministrante: Ministrante("Secomp UFSCar", "Secomp", "UFSCar"),
        inicio: DateTime.parse("2019-09-09 08:00:00"),
        fim: DateTime.parse("2019-09-09 09:00:00"),
        local: "Anfiteatro Bento Prado Jr.",
        descricao: "descricao"),
    Atividade(
        tipo: Tipo.Institucional,
        titulo: "Abertura",
        ministrante: Ministrante("Secomp UFSCar", "Secomp", "UFSCar"),
        inicio: DateTime.parse("2019-09-09 09:00:00"),
        fim: DateTime.parse("2019-09-09 10:00:00"),
        local: "Anfiteatro Bento Prado Jr.",
        descricao: "descricao"),
    Atividade(
        tipo: Tipo.Palestra,
        titulo: "Crimes Digitais e Computação Forense",
        ministrante: Ministrante("Vaine Luiz Barreira", "Professor", "UFSCar"),
        inicio: DateTime.parse("2019-09-10 08:00:00"),
        fim: DateTime.parse("2019-09-10 09:00:00"),
        local: "Anfiteatro Bento Prado Jr.",
        descricao: "descricao"),
    Atividade(
        tipo: Tipo.Palestra,
        titulo:
            "Homem x Máquina: o impacto da Inteligência Artificial na saúde",
        ministrante:
            Ministrante("Michel Silva Fornaciali", "Professor", "UFSCar"),
        inicio: DateTime.parse("2019-09-11 08:00:00"),
        fim: DateTime.parse("2019-09-11 09:00:00"),
        local: "Anfiteatro Bento Prado Jr.",
        descricao: "descricao"),
    Atividade(
        tipo: Tipo.Coffee,
        titulo: "Coffee-break",
        ministrante: Ministrante("", "", ""),
        inicio: DateTime.parse("2019-09-11 12:00:00"),
        fim: DateTime.parse("2019-09-11 13:00:00"),
        local: "Anfiteatro Bento Prado Jr. - anexo",
        descricao: "descricao"),
    Atividade(
        tipo: Tipo.Workshop,
        titulo: "Workshop Roi Hero",
        ministrante:
            Ministrante("Paulo Waib Castello Branco", "Professor", "UFSCar"),
        inicio: DateTime.parse("2019-09-12 08:00:00"),
        fim: DateTime.parse("2019-09-12 09:00:00"),
        local: "Anfiteatro Bento Prado Jr.",
        descricao: "descricao"),
  ];

  List<Atividade> segunda = listaAtv.where((atv) => atv.inicio.day == 9).toList();
  List<Atividade> terca = listaAtv.where((atv) => atv.inicio.day == 10).toList();
  List<Atividade> quarta = listaAtv.where((atv) => atv.inicio.day == 11).toList();
  List<Atividade> quinta = listaAtv.where((atv) => atv.inicio.day == 12).toList();
  List<Atividade> sexta = listaAtv.where((atv) => atv.inicio.day == 13).toList();

  // Widget _buildListAtividades(int index) {
  //   return CronogramaCard(atv: listaAtv[index]);
  // }

  // final BlocCronograma bloc = BlocProvider.getBloc<BlocCronograma>();

  @override
  Widget build(BuildContext context) {
    // bloc.fetchAtividades();

    return DefaultTabController(
      length: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Scaffold(
          appBar: TabBarNoRipple(
            labelColor: Colors.white,
            unselectedLabelColor: SecompColors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.cyan,
            ),
            tabs: <Widget>[
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Seg",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "09/09",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Ter",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "10/09",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Qua",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "11/09",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Qui",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "12/09",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Sex",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "13/09",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TabBarView(
              children: <Widget>[
                ListCronograma(list: segunda),
                ListCronograma(list: terca),
                ListCronograma(list: quarta),
                ListCronograma(list: quinta),
                ListCronograma(list: sexta),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
