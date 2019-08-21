import 'package:app_secomp/pages/login/login.dart';
import 'package:app_secomp/pages/participante/bloc_participante.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

void main() => runApp(AppSecomp());

class AppSecomp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'SECOMP',
        theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Lato'),
        home: CamposLogin(),
      ),
      blocs: [
        Bloc((i) => BlocParticipante()),
      ],
    );
  }
}
