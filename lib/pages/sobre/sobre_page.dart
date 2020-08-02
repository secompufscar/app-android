import 'dart:io' show Platform;

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/logo.dart';
import '../../components/text_button.dart';
import '../../icons/secomp_social_icons.dart';
import 'sobre_dc.dart';
import 'sobre_secomp.dart';
import 'sobre_ufscar.dart';

class Sobre extends StatelessWidget {
  final String versao = "7.0.1";

  /* As funções _likeOnFacebook, _likeOnInstagram, _likeOnTwitter, _sendEmail
     só funcionam em Android. Para iOS, considere usar url_launcher e dart:io  */

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
      } catch (e) {
        await browserIntent.launch();
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
      } catch (e) {
        await browserIntent.launch();
      }
    }
  }

  void _sendEmail() async {
    const url = 'mailto:marketing@secompufscar.com.br?subject=Contato SECOMP';
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
