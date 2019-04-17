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
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(Icons.access_time, size: 16,),
                ),
                Text(date),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
