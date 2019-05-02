import 'package:app_secomp/components/logo.dart';
import 'package:app_secomp/components/text_button.dart';
import 'package:app_secomp/icons/secomp_social_icons.dart';
import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  final String versao = "1.0.0";

  @override
  Widget build(BuildContext context) {
    final divisao = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Divider(),
    );

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
        divisao,
        //LINKS:
        // os prints são apenas para ter uma action (serve também para testar)
        // depois serão substituídas pela ação real.
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
        divisao,
        TextButton(
          "Siga-nos no Facebook",
          style: TextStyle(fontSize: 16),
          icon: Icon(SecompSocial.facebook_squared),
          action: () => print("facebook"),
        ),
        TextButton(
          "Siga-nos no Instagram",
          icon: Icon(SecompSocial.instagram),
          style: TextStyle(fontSize: 16),
          action: () => print("instagram"),
        ),
        TextButton(
          "Siga-nos no Twitter",
          style: TextStyle(fontSize: 16),
          icon: Icon(SecompSocial.twitter),
          action: () => print("twitter"),
        ),
        divisao,
        Center(
          child: Text(
            "Nosso email está disponível para qualquer dúvida, sugestão ou avaliação. Entre em contato!",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          "organizacaosecompufscar@gmail.com",
          style: TextStyle(fontSize: 16),
          icon: Icon(Icons.email),
          center: true,
          action: () => print("email"),
        ),
        Center(
            child: Text(
          "Versão $versao",
          style: TextStyle(color: Colors.grey),
        ))
      ],
    );
  }
}
