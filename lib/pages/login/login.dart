import 'package:app_secomp/models/participante.dart';
import 'package:app_secomp/pages/participante/bloc_participante.dart';
import 'package:app_secomp/pages/participante/participante.dart';
import 'package:app_secomp/util/api_helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_secomp/components/gradient_button.dart';
import 'package:app_secomp/base.dart';
import 'package:app_secomp/colors.dart';
import 'package:app_secomp/components/logo.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CamposLogin extends StatefulWidget {
  @override
  _CamposLoginState createState() => _CamposLoginState();
}

class _CamposLoginState extends State<CamposLogin> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final BlocParticipante blocParticipante =
      BlocProvider.getBloc<BlocParticipante>();

  final GlobalKey<OverlayState> _dialogKey = GlobalKey<OverlayState>();

  final APIHelper api = APIHelper();

  String email = '';
  String senha = '';

  Widget display = Container();

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

  void _handleError() {
    setState(() {
      display = Text("Email não existente ou senha inválida");
    });
    Future.delayed((Duration(seconds: 2)), () {});
    _formKey.currentState.reset();
    Navigator.of(_formKey.currentContext).pop();
  }

  @override
  Widget build(BuildContext context) {
    void _saveAndLogin() async {
      _formKey.currentState.save();
      setState(() {
        display = Container();
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          key: _dialogKey,
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              Text("Fazendo login..."),
            ],
          ),
        ),
      );

      try {
        await api.fetchParticipante(senha, email).then((p) async {
          blocParticipante.setParticipante(p);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Base(
                        first: ParticipanteScreen(),title: "Área do Participante",
                      )));
        }, onError: (_) => _handleError());
      } catch (_) {
        _handleError();
        return;
      }
    }

    Widget loginButton = GradientButton(
      onPressed: () => _saveAndLogin(),
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

    void _launchURL(BuildContext context, String url) async {
      try {
        await launch(
          url,
          option: new CustomTabsOption(
            toolbarColor: Theme.of(context).primaryColor,
            enableDefaultShare: true,
            enableUrlBarHiding: true,
            showPageTitle: true,
            animation: new CustomTabsAnimation.slideIn(),
            // or user defined animation.
            extraCustomTabs: <String>[
              // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
              'org.mozilla.firefox',
              // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
              'com.microsoft.emmx',
            ],
          ),
        );
      } catch (e) {
        // An exception is thrown if browser app is not installed on Android device.
        debugPrint(e.toString());
      }
    }

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
                  onSaved: (e) {
                    setState(() {
                      email = e;
                    });
                  },
                  cursorColor: Colors.teal,
                  obscureText: false,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.emailAddress,
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
                  onSaved: (p) {
                    setState(() {
                      senha = p;
                    });
                  },
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
                  onTap: () => _launchURL(context,
                      'https://secompufscar.com.br/participante/esqueci-senha'),
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
              Center(
                child: display,
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
                    onTap: () => _launchURL(context,
                        'https://secompufscar.com.br/participante/cadastro'),
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
