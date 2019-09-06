import 'package:app_secomp/components/ministrante_card.dart';
import 'package:app_secomp/models/ministrante.dart';
import 'package:flutter/material.dart';

class MinistrantePage extends StatelessWidget {
  final Ministrante min;

  const MinistrantePage({this.min});

  @override
  Widget build(BuildContext context) {
    Widget _buildMinistrante(Ministrante min) {
      return MinistranteCard(min: min);
    }

    return Material(
      color: Colors.white,
      child: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              "Ministrante",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          _buildMinistrante(min),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              "Biografia",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Text(
              min.biografia,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
