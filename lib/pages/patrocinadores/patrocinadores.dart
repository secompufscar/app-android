import 'package:app_secomp/models/patrocinador.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:app_secomp/pages/patrocinadores/button_patrocionadores.dart';
import 'package:cached_network_image/cached_network_image.dart';

bool _anime = false;
bool _animeTwo = true;
bool _animeThree = true;

class PatrocinadoresScreen extends StatefulWidget {
  @override
  _PatrocinadoresScreenState createState() => _PatrocinadoresScreenState();
  final String title = 'Patrocinadores';
}

class _PatrocinadoresScreenState extends State<PatrocinadoresScreen> {
  static Patrocinadores patrocinadores = new Patrocinadores();

  List<Patrocinador> patrocinadoresDiamante =
      patrocinadores.getCota("Diamante");
  List<Patrocinador> patrocinadoresOuro = patrocinadores.getCota("Ouro");
  List<Patrocinador> patrocinadoresPrata = patrocinadores.getCota("Prata");

  int tam = 0;
  List<Patrocinador> listLinks;

  Expanded inicializacao(int tam, List<Patrocinador> listLinks) {
  if (tam == 0) {
    return Expanded(
      child: imageList(patrocinadoresDiamante),
      flex: 6,
    );
  } else {
    return Expanded(
      child: imageList(listLinks),
      flex: 6,
    );
  }
}


  _onTap() {
    setState(() {
      _anime = !_anime;
      _animeTwo = true;
      _animeThree = true;
    });
    tam = patrocinadoresDiamante.length;
    listLinks = patrocinadoresDiamante;
  }

  _onTapTwo() {
    setState(() {
      _animeTwo = !_animeTwo;
      _anime = true;
      _animeThree = true;
    });
    tam = patrocinadoresOuro.length;
    listLinks = patrocinadoresOuro;
  }

  _onTapThree() {
    setState(() {
      _animeThree = !_animeThree;
      _animeTwo = true;
      _anime = true;
    });
    tam = patrocinadoresPrata.length;
    listLinks = patrocinadoresPrata;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: <Widget>[
          Expanded(
            child: ButtonPatrocionadores(
              onTap: _onTap,
              onTapTwo: _onTapTwo,
              onTapThree: _onTapThree,
              anime: _anime,
              animeTwo: _animeTwo,
              animeThree: _animeThree,
            ),
            flex: 1,
          ),
          inicializacao(tam, listLinks)
        ]),
      ),
    );
  }
}

GridView imageList(List<Patrocinador> listLinks) {
  return GridView.count(
    crossAxisCount: 2,
    children: List.generate(listLinks.length, (index) {
      return Container(
        padding: EdgeInsetsDirectional.only(top: 5, bottom: 5),
        height: 140,
        width: 170,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CachedNetworkImage(
              imageUrl: 'https://secompufscar.com.br/static/images/patrocinadores/${listLinks[index].img}',
              placeholder: (context, url) => SpinKitChasingDots(
                color: Colors.cyan,
                size: 30,
              ),
            ),
          ),
        ),
      );
    }),
  );
}

