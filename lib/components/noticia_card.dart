import 'package:flutter/material.dart';
import 'package:app_secomp/components/card.dart';

class NoticiaCard extends StatelessWidget {
  final String content;
  final String date;

  NoticiaCard({this.content, this.date});

  @override
  Widget build(BuildContext context) {
    return SecompCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(content),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.access_time),
              Text(date),
            ],
          ),
        ],
      ),
    );
  }
}
