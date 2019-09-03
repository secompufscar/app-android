import 'dart:math';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:app_secomp/pages/patrocinadores/button_patrocionadores.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

final List<String> patrocinadoresPrata = <String> ['https://picsum.photos/id/11/250/250', 'https://picsum.photos/id/11/250/250', 'https://picsum.photos/id/11/250/250', 'https://picsum.photos/id/11/250/250', 'https://picsum.photos/id/11/250/250', 'https://picsum.photos/id/11/250/250', 'https://picsum.photos/id/11/250/250', 'https://picsum.photos/id/11/250/250', 'https://picsum.photos/id/11/250/250'];
final List<String> patrocinadoresOuro = <String>['https://picsum.photos/id/10/250/250', 'https://picsum.photos/id/10/250/250', 'https://picsum.photos/id/10/250/250', 'https://picsum.photos/id/10/250/250', 'https://picsum.photos/id/10/250/250', 'https://picsum.photos/id/10/250/250', 'https://picsum.photos/id/10/250/250', 'https://picsum.photos/id/10/250/250'];
final List<String> patrocinadoresDiamente = <String>['https://picsum.photos/250?image=9', 'https://picsum.photos/250?image=9', 'https://picsum.photos/250?image=9', 'https://picsum.photos/250?image=9', 'https://picsum.photos/250?image=9', 'https://picsum.photos/250?image=9'];

  bool _anime = false;
  bool _animeTwo = true;
  bool _animeThree = true;

class Patrocinadores extends StatefulWidget{
  @override
  _PatrocinadoresState createState() => _PatrocinadoresState();
   final String title = 'Patrocinadores';
}

class _PatrocinadoresState extends State<Patrocinadores>{

    int tam = 0;
    List<String> listLinks;

  _onTap(){
      setState(() {
      _anime = !_anime;
      _animeTwo = true;
      _animeThree = true;
    });
    tam = patrocinadoresDiamente.length;
    listLinks = patrocinadoresDiamente;
  }

  _onTapTwo(){
      setState(() {
      _animeTwo = !_animeTwo;
      _anime = true;
      _animeThree = true;
    });
    tam = patrocinadoresOuro.length;
    listLinks = patrocinadoresOuro;
  }

  _onTapThree(){
      setState(() {
      _animeThree = !_animeThree;
      _animeTwo = true;
      _anime = true;
    });
    tam = patrocinadoresPrata.length;
    listLinks = patrocinadoresPrata;
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
               Expanded(
                  child: ButtonPatrocionadores(onTap: _onTap, onTapTwo: _onTapTwo, onTapThree: _onTapThree, 
                                         anime: _anime, animeTwo: _animeTwo, animeThree: _animeThree,),
                flex: 1,
              ),
            inicializacao(tam, listLinks)
            ]
          ),
        ),      
    );
  }
}

ListView imageList(List<String> listLinks){
  return ListView.separated(
                itemCount: patrocinadoresDiamente.length,
                itemBuilder: (BuildContext context, int index) { 
                return Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Container(
                        padding: EdgeInsetsDirectional.only(top: 5, bottom: 5),
                        height: 140,
                        width: 170,
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: '${listLinks[index]}',
                            placeholder: (context,url) => SpinKitChasingDots(color: Colors.cyan, size: 30,),
                          ),
                        ),  
                     ),
                      Container(
                       padding: EdgeInsetsDirectional.only(top: 5, bottom: 5),
                        height: 140,
                        width: 170,
                        child: Center(
                          child: CachedNetworkImage(
                         imageUrl: '${listLinks[index]}',
                          placeholder: (context,url) => SpinKitChasingDots(color: Colors.cyan, size: 30,),
                          )
                        ),
                      ),
                  ]
                ),
                );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 0, indent: 0,),
      );
}

Expanded inicializacao(int tam, List<String> listLinks){

  if(tam == 0){ 
    return Expanded(
          child: imageList(patrocinadoresDiamente),
    flex: 6,
    );
  }else{
    return Expanded(
      child: imageList(listLinks),
      flex: 6,
            );
  }
}