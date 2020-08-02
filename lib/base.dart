import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'bloc/blocs.dart';
import 'colors.dart';
import 'components/logo.dart';
import 'pages/pages.dart';
import 'repository/repositories.dart';

class Base extends StatefulWidget {
  final Widget first;
  final String title;

  Base({this.first, this.title});

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  Widget _body;
  String _title;
  // final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _body = widget.first;
    _title = widget.title;
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        BlocProvider.of<NoticiasBloc>(context).add(NoticiasRefreshRequested());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void _updatePage(Widget body, {String title: "X SECOMP"}) {
      setState(() {
        _body = body;
        _title = title;
      });
      Navigator.pop(context);
    }

    Drawer _drawer = Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: LogoSeKombi()),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () => _updatePage(HomePage()),
          ),
          ListTile(
            title: Text("Área do Participante"),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Cronograma"),
            leading: Icon(Icons.calendar_view_day),
            onTap: () => _updatePage(Cronograma(), title: "Cronograma"),
          ),
          ListTile(
            title: Text("Equipe"),
            leading: Icon(Icons.people),
            onTap: () => _updatePage(Equipe(), title: "Equipe"),
          ),
          ListTile(
            title: Text("Patrocinadores"),
            leading: Icon(Icons.star),
            onTap: () =>
                _updatePage(PatrocinadoresScreen(), title: "Patrocinadores"),
          ),
          ListTile(
            title: Text("Descontos"),
            leading: Icon(Icons.shopping_cart),
            onTap: () => _updatePage(DescontosWidget(), title: "Descontos"),
          ),
          ListTile(
            title: Text("Sobre"),
            leading: Icon(Icons.info),
            onTap: () => _updatePage(Sobre(), title: "Sobre"),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          _title,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        gradient: LinearGradient(
            colors: [SecompColors.gradientStart, SecompColors.gradientEnd]),
      ),
      drawer: _drawer,
      body: _body,
    );
  }
}

class LoginSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.status != AuthenticationStatus.authenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => LoginPage(),
            ),
          );
        }
      },
      child: Container(),
    );
  }
}
