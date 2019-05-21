import 'package:flutter/material.dart';
import 'package:app_secomp/models/news.dart';
import 'package:app_secomp/components/noticia_card.dart';

class NewsList extends StatelessWidget {
  final List<News> news;
  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildListNoticias(int index, List list) {
      return NoticiaCard(
        content: list[index].title,
        date: list[index].publishedAt,
      );
    }

    return ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: news.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildListNoticias(index, news),
        );
  }
}