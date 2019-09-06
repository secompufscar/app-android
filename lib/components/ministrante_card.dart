import 'package:app_secomp/models/ministrante.dart';
import 'package:flutter/material.dart';

class MinistranteCard extends Container {
  MinistranteCard({this.min});
  final Ministrante min;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.network(
              'https://secompufscar.com.br/uploads/fotos_ministrantes/${min.img}',
              fit: BoxFit.cover,
              width: 80,
              height: 80,
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    min.nome,
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(
                    min.cargo,
                    style: TextStyle(color: Colors.black54),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(
                    min.instituicao,
                    style: TextStyle(color: Colors.black54),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
