import 'package:app_secomp/colors.dart';
import 'package:app_secomp/pages/equipe/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';

class Equipe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Scaffold(
          appBar: TabBarNoRipple(
            labelColor: Colors.white,
            unselectedLabelColor: SecompColors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(horizontal: 6),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.cyan,
            ),
            tabs: <Tab>[
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.people),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.laptop),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.perm_contact_calendar),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.palette),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.work),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.attach_money),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.sentiment_very_satisfied),
                  ),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              EquipeList(diretoria: "Coordenação Geral"),
              EquipeList(diretoria: "Diretoria de TI"),
              EquipeList(diretoria: "Diretoria de Conteúdo"),
              EquipeList(diretoria: "Diretoria de Design & Marketing"),
              EquipeList(diretoria: "Diretoria de Patrocínio"),
              EquipeList(diretoria: "Diretoria Jurídico-Financeiro"),
              EquipeList(diretoria: "Diretoria Sócio-Cultural"),
            ],
          ),
        ),
      ),
    );
  }
}
