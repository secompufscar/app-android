import 'package:flutter/material.dart';
import 'package:app_secomp/base.dart';

void main() => runApp(AppSecomp());

class AppSecomp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Base(),
    );
  }
}
