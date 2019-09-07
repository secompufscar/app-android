import 'package:app_secomp/models/ministrante.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class MinistrantePage extends StatelessWidget {
  final Ministrante min;

  const MinistrantePage({this.min});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: Text("Ministrante")),
      body: Material(
        child: ListView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://secompufscar.com.br/static/images/ministrantes/" +
                              min.img,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                      placeholder: (context, url) => Container(
                        width: 80,
                        height: 80,
                        child: Center(
                          child: SpinKitChasingDots(
                            color: Colors.cyan,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
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
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Text(
                          min.cargo,
                          style: TextStyle(color: Colors.black54),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
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
                  height: 1.25,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
