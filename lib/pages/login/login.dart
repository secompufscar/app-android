import 'package:flutter/material.dart';
import 'package:app_secomp/components/gradient_button.dart';
import 'package:app_secomp/base.dart';
import 'package:app_secomp/colors.dart';
import 'package:app_secomp/components/logo.dart';
import 'package:app_secomp/pages/login/cadastro_webview.dart';

class CamposLogin extends StatelessWidget {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[
          Color(0xFF33A4A0),
          Color(0xFF07CDA2),
          Color(0xFF0BB6A8),
          Color(0xFF0CADAA),
          Color(0xFF118BB2),
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget loginButton = GradientButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Base()),
        );
      },
      gradient: LinearGradient(
        colors: <Color>[
          SecompColors.gradientStart,
          SecompColors.gradientEnd,
        ],
      ),
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );

    return new Scaffold(
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey,
          autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            children: <Widget>[
              LogoSeKombi(w: 300, h: 300),
              new TextFormField(
                  cursorColor: Colors.teal,
                  obscureText: false,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal[300])),
                    icon: Icon(Icons.person),
                    contentPadding:
                        new EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
                    //border: OutlineInputBorder(),
                    labelText: 'Usuário',
                  )),
              new Padding(
                padding: EdgeInsets.all(8),
              ),
              new TextFormField(
                  cursorColor: Colors.teal,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      contentPadding:
                          new EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
                      labelText: 'Senha')),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    //TODO: colocar webview
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      'Esqueceu sua senha ?',
                      style: TextStyle(
                        color: Colors.teal[200],
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 80, bottom: 80),
                child: loginButton,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Não tem conta ?'),
                  new InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CadastroWebView()),
                      );
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: new Text(
                      ' Crie uma conta',
                      style: TextStyle(
                          color: Colors.teal[200], fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
