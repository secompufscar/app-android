import 'package:flutter/material.dart';
import 'package:app_secomp/colors.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:app_secomp/routes/home.dart';
import 'package:app_secomp/routes/blank.dart';
import 'package:app_secomp/routes/dicas.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  Widget _body = HomePage();
  String _title = "X SECOMP";

  void _pushTo(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
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
          DrawerHeader(
            child: Image(
              image: AssetImage('assets/logos/colorida-completa.png'),
              height: 100,
              width: 100,
            ),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () => _updatePage(HomePage()),
          ),
          ListTile(
            title: Text("Página do Participante"),
            leading: Icon(Icons.person),
            onTap: () => _updatePage(BlankPage(), title: "Página do Participante"),
          ),
          ListTile(
            title: Text("Cronograma"),
            leading: Icon(Icons.calendar_view_day),
            onTap: () => _updatePage(BlankPage(), title: "Cronograma"),
          ),
          ListTile(
            title: Text("Equipe"),
            leading: Icon(Icons.people),
            onTap: () => _updatePage(BlankPage(), title: "Equipe"),
          ),
          ListTile(
            title: Text("Patriocinadores"),
            leading: Icon(Icons.star),
            onTap: () => _updatePage(BlankPage(), title: "Patriocinadores"),
          ),
          ListTile(
            title: Text("Dicas"),
            leading: Icon(Icons.lightbulb_outline),
            onTap: () => _pushTo(Dicas()),
          ),
          ListTile(
            title: Text("Sobre"),
            leading: Icon(Icons.info),
            onTap: () => _updatePage(BlankPage(), title: "Sobre"),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: GradientAppBar(
        title: Text(_title),
        backgroundColorStart: SecompColors.gradientStart,
        backgroundColorEnd: SecompColors.gradientEnd,
      ),
      drawer: _drawer,
      body: _body,
    );
  }
}
