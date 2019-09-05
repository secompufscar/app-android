import 'package:app_secomp/components/card_equipe.dart';
import 'package:app_secomp/models/membro.dart';
import 'package:flutter/material.dart';

class EquipeList extends StatelessWidget {
  
  final String diretoria; 
  Membros membros = Membros();

  EquipeList({this.diretoria});

  @override
  Widget build(BuildContext context) {
    final List<Membro> list = membros.getDiretoria(diretoria);

    return ListView(
      children: <Widget> [
        Center(child: Text(diretoria, style: TextStyle(fontSize: 20))),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) => CardEquipe(
            nome: list[index].nome,
            descricao: list[index].bio,
            img: list[index].img,
          ),
        ),
      ],
    );
  }
}