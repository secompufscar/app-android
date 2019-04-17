import 'package:flutter/material.dart';
import 'package:app_secomp/colors.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:app_secomp/routes/home.dart';
import 'package:app_secomp/routes/blank.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  Widget _body = HomePage();

  @override
  Widget build(BuildContext context) {

    void _updateBody(Widget body) {
      setState(() {
            _body = body;
          });
      Navigator.pop(context);
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
            onTap: () => _updateBody(HomePage()),
          ),
          ListTile(
            title: Text("Página do Participante"),
            leading: Icon(Icons.person),
            onTap: () => _updateBody(BlankPage()),
          ),
          ListTile(
            title: Text("Cronograma"),
            leading: Icon(Icons.calendar_view_day),
            onTap: () => _updateBody(BlankPage()),
          ),
          ListTile(
            title: Text("Equipe"),
            leading: Icon(Icons.people),
            onTap: () => _updateBody(BlankPage()),
          ),
          ListTile(
            title: Text("Patriocinadores"),
            leading: Icon(Icons.star),
            onTap: () => _updateBody(BlankPage()),
          ),
          ListTile(
            title: Text("Dicas"),
            leading: Icon(Icons.lightbulb_outline),
            onTap: () => _updateBody(BlankPage()),
          ),
          ListTile(
            title: Text("Sobre"),
            leading: Icon(Icons.info),
            onTap: () => _updateBody(BlankPage()),
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
