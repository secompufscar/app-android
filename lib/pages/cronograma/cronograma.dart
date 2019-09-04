import 'package:app_secomp/colors.dart';
import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/pages/cronograma/bloc_cronograma.dart';
import 'package:app_secomp/pages/cronograma/list_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';

class Cronograma extends StatelessWidget {

  final BlocCronograma bloc = BlocProvider.getBloc<BlocCronograma>();

  @override
  Widget build(BuildContext context) {
    bloc.fetchAtividades();

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
            body: StreamBuilder(
              stream: bloc.outAtividades,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data.isEmpty) {
                  return Center(
                    child: GestureDetector(
                      onTap: bloc.reload,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text(
                              "Ocorreu algum erro :( \nToque aqui para recarregar"),
                        ),
                      ),
                    ),
                  );
                } else {
                  List<Atividade> lista = snapshot.data;
                  List<Atividade> segunda =
                      lista.where((atv) => atv.inicio != null && atv.inicio.day == 9).toList();
                  List<Atividade> terca =
                      lista.where((atv) => atv.inicio != null && atv.inicio.day == 10).toList();
                  List<Atividade> quarta =
                      lista.where((atv) => atv.inicio != null && atv.inicio.day == 11).toList();
                  List<Atividade> quinta =
                      lista.where((atv) => atv.inicio != null && atv.inicio.day == 12).toList();
                  List<Atividade> sexta =
                      lista.where((atv) => atv.inicio != null && atv.inicio.day == 13).toList();

                  return TabBarView(
                    children: <Widget>[
                      ListCronograma(list: segunda),
                      ListCronograma(list: terca),
                      ListCronograma(list: quarta),
                      ListCronograma(list: quinta),
                      ListCronograma(list: sexta),
                    ],
                  );
                }
              },
            )),
      ),
    );
  }
}
