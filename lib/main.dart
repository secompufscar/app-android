import 'package:app_secomp/base.dart';
import 'package:app_secomp/pages/cronograma/bloc_cronograma.dart';
import 'package:app_secomp/pages/home/bloc_home.dart';
import 'package:app_secomp/pages/home/home.dart';
import 'package:app_secomp/pages/intro/intro.dart';
import 'package:app_secomp/pages/participante/bloc_participante.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(AppSecomp());

class AppSecomp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final FirebaseMessaging _fcm = FirebaseMessaging();
    _fcm.subscribeToTopic('noticias');

    Future<Widget> getHomeWidget() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool entered = prefs.getBool('entered');
      if (entered == null) {
        prefs.setBool('entered', true);
        return Intro();
      } else
        return Base(first: HomePage(), title: "X SECOMP",);
    }

    return BlocProvider(
      child: MaterialApp(
        title: 'SECOMP',
        theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Lato'),
        home: FutureBuilder(
          future: getHomeWidget(),
          builder: (context, snapshot) =>
              snapshot.hasData ? snapshot.data : Container(),
        ),
      ),
      /* Injeções dos Bloc 
        Toda vez que for criado um novo bloc é necessário
        inserir nesse lista */
      blocs: [ 
        Bloc((i) => BlocHome()),
        Bloc((i) => BlocCronograma()),
        Bloc((i) => BlocParticipante())
      ],
    );
  }
}
