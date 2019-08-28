import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_secomp/components/noticia_card.dart';
import 'package:app_secomp/models/noticia.dart';

import 'bloc_home.dart';

class HomePage extends StatelessWidget {
  
  final BlocHome bloc = BlocProvider.getBloc<BlocHome>();



  String getTime(DateTime time) {
    Duration difference = DateTime.now().difference(time);
    if (difference.inSeconds < 60) {
      return "agora";
    } else if (difference.inMinutes < 60) {
      return "há ${difference.inMinutes} min";
    } else if (difference.inHours < 24) {
      return "há ${difference.inHours} horas";
    } else if (difference.inDays == 1) {
      return "há 1 dia";
    } else {
      return "há ${difference.inDays} dias";
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildListNoticias(List<Noticia> noticias, int index) {
      String time = getTime(noticias[index].date);
      return NoticiaCard(
        content: noticias[index].content,
        date: time,
      );
    }

    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            "Notícias",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        StreamBuilder(
            stream: bloc.outNoticias,
            builder: (context, snapshot) {
              return ListView.builder(
                reverse: true,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) =>
                    _buildListNoticias(snapshot.data, index),
              );
            }),
      ],
    );
  }
}
