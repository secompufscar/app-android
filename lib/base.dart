import 'package:flutter/material.dart';
import 'package:app_secomp/colors.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:app_secomp/routes/home.dart';
import 'package:app_secomp/routes/blank.dart';

const HOME = 1;
const PARTICIPANTE = 2;
const CRONOGRAMA = 3;
const EQUIPE = 4;
const PATRIOCINADORES = 5;
const DICAS = 6;
const SOBRE = 7;

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  Widget _body = HomePage();

  @override
  Widget build(BuildContext context) {

    void _updateBody(int bodyNumber) {
      switch (bodyNumber) {
        case HOME:
          setState(() {
            _body = HomePage();
          });
          Navigator.pop(context);
          break;
        default:
          setState((){
            _body = BlankPage();
          });
          Navigator.pop(context);
      }
    }

    Drawer _drawer = Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("Inserir logo da SECOMP"),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () => _updateBody(HOME),
          ),
          ListTile(
            title: Text("Página do Participante"),
            leading: Icon(Icons.person),
            onTap: () => _updateBody(0),
          ),
          ListTile(
            title: Text("Cronograma"),
            leading: Icon(Icons.calendar_view_day),
            onTap: () => _updateBody(0),
          ),
          ListTile(
            title: Text("Equipe"),
            leading: Icon(Icons.people),
            onTap: () => _updateBody(0),
          ),
          ListTile(
            title: Text("Patriocinadores"),
            leading: Icon(Icons.star),
            onTap: () => _updateBody(0),
          ),
          ListTile(
            title: Text("Dicas"),
            leading: Icon(Icons.lightbulb_outline),
            onTap: () => _updateBody(0),
          ),
          ListTile(
            title: Text("Sobre"),
            leading: Icon(Icons.info),
            onTap: () => _updateBody(0),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: GradientAppBar(
        title: Text("X SECOMP"),
        backgroundColorStart: SecompColors.gradientStart,
        backgroundColorEnd: SecompColors.gradientEnd,
      ),
      drawer: _drawer,
      body: _body,
    );
  }
}
