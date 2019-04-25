import 'package:app_secomp/components/logo.dart';
import 'package:app_secomp/components/text_button.dart';
import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      children: <Widget>[
        //TOP:
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Center(child: LogoSeKombi()),
        ),
        Center(
          child: Text(
            "X Semana da Computação da UFSCar",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        Center(
          child: Text(
            "9 a 13 de setembro de 2019",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
        ),
        //DIVISAO:
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Divider(),
        ),
        //LINKS:
        TextButton(
          "A SECOMP",
          action: () => print("a secomp"),
        ),
        TextButton(
          "O Departamento da Computação",
          action: () => print("dc"),
        ),
        TextButton(
          "A UFSCar",
          action: () => print("a ufscar"),
        ),
      ],
    );
  }
}
