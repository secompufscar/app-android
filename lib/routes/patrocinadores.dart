import 'package:app_secomp/routes/login.dart';
import 'package:flutter/material.dart';
import 'package:app_secomp/routes/button_patrocionadores.dart';

class Patrocinadores extends StatefulWidget{
  @override
  _PatrocinadoresState createState() => _PatrocinadoresState();
   final String title = 'Patrocinadores';
}

class _PatrocinadoresState extends State<Patrocinadores>{

  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'L'];
  bool _anime = true;
  bool _animeTwo = true;
  bool _animeThree = true;

  _onTap(){
      setState(() {
      _anime = !_anime;
      _animeTwo = true;
      _animeThree = true;
    });
  }

  _onTapTwo(){
      setState(() {
      _animeTwo = !_animeTwo;
      _anime = true;
      _animeThree = true;
    });
  }

  _onTapThree(){
      setState(() {
      _animeThree = !_animeThree;
      _animeTwo = true;
      _anime = true;
    });
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
            Expanded(
                child: ListView.separated(
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  //margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),       
                     Container(
                        height: 100,
                        width: 170,
                        child: Center(child: Text('Patrocinador ${entries[index]}')),
                     ),
                      Container(
                        height: 100,
                        width: 170,
                        child: Center(child: Text('Patrocinador ${entries[index]}')),
                      ),
                  ]
                );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 0, indent: 0,),
            ),
            flex: 6,
          ),
            ]
          ),
        ),      
    );
  }
}