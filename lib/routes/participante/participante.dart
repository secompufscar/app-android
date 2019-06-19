import 'package:app_secomp/routes/participante/edicoes_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:app_secomp/routes/participante/usuario_tab_view.dart';

class PaginaParticipante extends StatelessWidget {
  final TextStyle _style = TextStyle(color: Colors.cyan);

  Tab _buildTab({IconData icon, String text}) {
    return Tab(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: Colors.cyan,),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                text.toUpperCase(),
                style: _style,
              ),
            )
          ],
        ),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: Colors.cyan,
          labelColor: Colors.cyan,
          tabs: <Widget>[
            _buildTab(
              icon: Icons.person,
              text: "Usuário",
            ),
            _buildTab(
              icon: Icons.list,
              text: "Edições",
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            UsuarioTabView(),
            EdicoesTabView(),
          ],
        ),
      ),
    );
  }
}
