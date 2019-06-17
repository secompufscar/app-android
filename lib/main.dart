import 'package:app_secomp/routes/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(AppSecomp());

class AppSecomp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SECOMP',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Lato',
      ),
      home: CamposLogin(),
    );
  }
}
