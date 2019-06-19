import 'package:app_secomp/components/text_button.dart';
import 'package:app_secomp/models/evento.dart';
import 'package:flutter/material.dart';
import 'package:app_secomp/components/card.dart';

class EdicoesTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List eventos = <Evento>[
      Evento(
          ativo: false,
          edicao: "9ª SECOMP UFSCar",
          ano: "2018",
          inscritos: 570),
      Evento(
          ativo: true,
          edicao: "10ª SECOMP UFSCar",
          ano: "2019",
          inscritos: 100),
    ];

    Widget _buildCardEvento(int index) {
      Evento e = eventos[index];

      return SecompCard(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image.asset(
                    'assets/logos/colorida-pentagono.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      e.edicao,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(Icons.calendar_today),
                        ),
                        Text("Ano: ${e.ano}"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(Icons.people),
                        ),
                        Text("Inscritos: ${e.inscritos}"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (e.ativo) ...[
                  TextButton(
                    "Inscrever-se",
                    action: () {},
                    icon: Icon(
                      Icons.person_add,
                      color: Colors.green,
                    ),
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  )
                ] else
                  TextButton(
                    "Ver Informações",
                    action: () {},
                    icon: Icon(
                      Icons.info,
                      color: Colors.cyan,
                    ),
                    style: TextStyle(fontSize: 16, color: Colors.cyan),
                  ),
              ],
            )
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: eventos.length,
      itemBuilder: (BuildContext context, int index) => _buildCardEvento(index),
    );
  }
}
