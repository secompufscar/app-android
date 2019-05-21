import 'package:flutter/material.dart';
import 'package:app_secomp/components/news_builder.dart';
import 'package:app_secomp/models/news.dart';
import 'package:app_secomp/util/api_helper.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final Widget body = HomePage2();

  APIHelper helper = APIHelper();

  @override
  Widget build(BuildContext context) {

    FutureBuilder<List<News>> builder = FutureBuilder(
      future: helper.getNewsList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData ? NewsList(news: snapshot.data) : Center(child: CircularProgressIndicator());
      }
    );

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
        builder,
      ],
    );
  }
}
