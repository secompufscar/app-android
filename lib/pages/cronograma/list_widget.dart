import 'package:flutter/material.dart';

import '../../components/cronograma_card.dart';
import '../../models/models.dart';

class ListCronograma extends StatelessWidget {
  final List<Atividade> list;

  ListCronograma({this.list});

  Widget _buildListAtividades(int index, List<Atividade> list) {
    return CronogramaCard(atv: list[index]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) =>
          _buildListAtividades(index, list),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView(
  //     physics: ClampingScrollPhysics(),
  //     shrinkWrap: false,
  //     children: <Widget>[
  //       StreamBuilder(
  //         stream: bloc.outAtividades,
  //         builder: (context, snapshot) {
  //           if (!snapshot.hasData) {
  //             return Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           }
  //           if (snapshot.hasError || snapshot.data.isEmpty) {
  //             return Center(
  //               child: GestureDetector(
  //                 onTap: bloc.reload,
  //                 child: Container(
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(32.0),
  //                     child: Text(
  //                         'Ocorreu algum erro :( \nToque aqui para recarregar'),
  //                   ),
  //                 ),
  //               ),
  //             );
  //           } else if (snapshot.hasData) {
  //             return ListView.builder(
  //               physics: ClampingScrollPhysics(),
  //               shrinkWrap: true,
  //               itemCount: snapshot.data.length,
  //               itemBuilder: (BuildContext context, int index) =>
  //                   _buildListAtividades(index, snapshot.data),
  //             );
  //           } else {
  //             return Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           }
  //         },
  //       ),
  //     ],
  //   );
  // }
}
