import 'package:app_secomp/components/logo.dart';
import 'package:app_secomp/components/text_button.dart';
import 'package:app_secomp/icons/secomp_social_icons.dart';
import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';
import 'package:app_secomp/pages/sobre/sobre_ufscar.dart';
import 'package:app_secomp/pages/sobre/sobre_dc.dart';
import 'package:app_secomp/pages/sobre/sobre_secomp.dart';

import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';

class Sobre extends StatelessWidget {
  final String versao = "1.0.0";

  void _likeOnFacebook() async {
    if (Platform.isAndroid) {
      AndroidIntent browserIntent = AndroidIntent(
        action: 'action_view',
        data: 'https://www.facebook.com/secompufscar',
      );
      AndroidIntent facebookIntent = AndroidIntent(
          action: 'action_view',
          data: 'fb://facewebmodal/f?href=https://facebook.com/secompufscar');
      try {
        await facebookIntent.launch();
        print("foi pelo face");
      } catch (e) {
        await browserIntent.launch();
        print("foi pelo browser");
      }
    }
  }

  void _likeOnInstagram() async {
    if (Platform.isAndroid) {
      AndroidIntent browserIntent = AndroidIntent(
        action: 'action_view',
        data: 'https://www.instagram.com/secompufscar',
      );
      AndroidIntent instagramIntent = AndroidIntent(
          package: "com.instagram.android",
          action: 'action_view',
          data: 'https://instagram.com/_u/secompufscar');
      try {
        await instagramIntent.launch();
        print("foi pelo insta");
      } catch (e) {
        await browserIntent.launch();
        print("foi pelo browser");
      }
    }
  }

  void _likeOnTwitter() async {
    if (Platform.isAndroid) {
      AndroidIntent browserIntent = AndroidIntent(
        action: 'action_view',
        data: 'https://twitter.com/secompufscar',
      );
      AndroidIntent twitterIntent = AndroidIntent(
          package: "com.twitter.android",
          action: 'action_view',
          data: 'twitter://user?user=secompufscar');
      try {
        await twitterIntent.launch();
        print("foi pelo twitter");
      } catch (e) {
        await browserIntent.launch();
        print("foi pelo browser");
      }
    }
  }

  void _sendEmail() async {
    const url =
        'mailto:marketing@secompufscar.com.br?subject=Contato SECOMP';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
        TextButton("A SECOMP",
            action: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SobreSecomp()))),
        TextButton("O Departamento da Computação",
            action: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => SobreDC()))),
        TextButton("A UFSCar",
            action: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SobreUfscar()))),
        divisao,
        TextButton(
          "Siga-nos no Facebook",
          style: TextStyle(fontSize: 16),
          icon: Icon(SecompSocial.facebook_squared),
          action: _likeOnFacebook,
        ),
        TextButton(
          "Siga-nos no Instagram",
          icon: Icon(SecompSocial.instagram),
          style: TextStyle(fontSize: 16),
          action: _likeOnInstagram,
        ),
        TextButton(
          "Siga-nos no Twitter",
          style: TextStyle(fontSize: 16),
          icon: Icon(SecompSocial.twitter),
          action: _likeOnTwitter,
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
          "marketing@secompufscar.com.br",
          style: TextStyle(fontSize: 16),
          icon: Icon(Icons.email),
          center: true,
          action: _sendEmail,
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
