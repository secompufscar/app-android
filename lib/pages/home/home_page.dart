import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../components/noticia_card.dart';
import '../../models/models.dart';

class HomePage extends StatelessWidget {
  String getTime(DateTime time) {
    Duration difference = DateTime.now().difference(time);
    if (difference.inSeconds < 60) {
      return 'agora';
    } else if (difference.inMinutes < 60) {
      return 'há ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'há ${difference.inHours} horas';
    } else if (difference.inDays == 1) {
      return 'há 1 dia';
    } else {
      return 'há ${difference.inDays} dias';
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
            'Notícias',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        BlocBuilder<NoticiasBloc, NoticiasState>(builder: (context, state) {
          if (state is NoticiasLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NoticiasLoadSuccess) {
            final noticias = state.noticias;
            return ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: noticias.length,
              itemBuilder: (BuildContext context, int index) =>
                  _buildListNoticias(noticias, index),
            );
          } else if (state is NoticiasLoadFailure) {
            return GestureDetector(
              onTap: () => BlocProvider.of<NoticiasBloc>(context)
                  .add(NoticiasRequested()),
              child: Expanded(
                child: Container(
                  child: Center(
                      child:
                          Text('Ocorreu algum erro :(\nToque para recarregar')),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ],
    );
  }
}
