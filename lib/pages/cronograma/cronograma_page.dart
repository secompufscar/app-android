import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';

import '../../bloc/blocs.dart';
import '../../colors.dart';
import '../../models/models.dart';
import 'list_widget.dart';

class Cronograma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                            'Seg',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '09/09',
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
                            'Ter',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '10/09',
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
                            'Qua',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '11/09',
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
                            'Qui',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '12/09',
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
                            'Sex',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '13/09',
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
              child: BlocBuilder<AtividadesBloc, AtividadesState>(
                builder: (context, state) {
                  if (state is AtividadesLoadInProgress) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is AtividadesLoadFailure) {
                    return Center(
                      child: GestureDetector(
                        onTap: () => BlocProvider.of<AtividadesBloc>(context)
                            .add(AtividadesRequested()),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Text(
                                'Ocorreu algum erro :( \nToque aqui para recarregar'),
                          ),
                        ),
                      ),
                    );
                  } else if (state is AtividadesLoadSuccess) {
                    final lista = state.atividades;
                    List<Atividade> segunda = lista
                        .where(
                            (atv) => atv.inicio != null && atv.inicio.day == 9)
                        .toList();
                    List<Atividade> terca = lista
                        .where(
                            (atv) => atv.inicio != null && atv.inicio.day == 10)
                        .toList();
                    List<Atividade> quarta = lista
                        .where(
                            (atv) => atv.inicio != null && atv.inicio.day == 11)
                        .toList();
                    List<Atividade> quinta = lista
                        .where(
                            (atv) => atv.inicio != null && atv.inicio.day == 12)
                        .toList();
                    List<Atividade> sexta = lista
                        .where(
                            (atv) => atv.inicio != null && atv.inicio.day == 13)
                        .toList();

                    segunda.sort((a, b) => a.inicio.compareTo(b.inicio));
                    terca.sort((a, b) => a.inicio.compareTo(b.inicio));
                    quarta.sort((a, b) => a.inicio.compareTo(b.inicio));
                    quinta.sort((a, b) => a.inicio.compareTo(b.inicio));
                    sexta.sort((a, b) => a.inicio.compareTo(b.inicio));

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
              ),
            )),
      ),
    );
  }
}
