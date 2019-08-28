import 'package:app_secomp/base.dart';
import 'package:app_secomp/pages/cronograma/bloc_cronograma.dart';
import 'package:app_secomp/pages/home/bloc_home.dart';
import 'package:app_secomp/pages/intro/intro.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(AppSecomp());

class AppSecomp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Widget> getHomeWidget() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool entered = prefs.getBool('entered');
      if (entered == null) {
        prefs.setBool('entered', true);
        return Intro();
      } else
        return Base();
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
      blocs: [
        Bloc((i) => BlocHome()),
        Bloc((i) => BlocCronograma()),
      ],
    );
  }
}
