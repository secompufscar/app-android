import 'package:app_secomp/components/card.dart';
import 'package:flutter/material.dart';

class CardEquipe extends Container {
  CardEquipe({this.nome, this.descricao, this.cargo, this.img});
  final String nome;
  final String descricao;
  final String cargo;
  final String img;

  @override
  Widget build(BuildContext context) {
    return SecompCard(
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.asset('assets/equipe/$img', fit: BoxFit.cover, width: 80, height: 80,),
          ),
          Flexible(
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(nome, style: TextStyle(fontSize: 16), overflow: TextOverflow.clip, maxLines: 2, softWrap: true,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(descricao, style: TextStyle(color: Colors.black54),overflow: TextOverflow.fade, maxLines: 3, softWrap: true,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}