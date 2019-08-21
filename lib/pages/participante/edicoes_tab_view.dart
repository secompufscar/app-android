import 'package:app_secomp/components/text_button.dart';
import 'package:app_secomp/models/evento.dart';
import 'package:flutter/material.dart';
import 'package:app_secomp/components/card.dart';
import 'package:app_secomp/pages/participante/inscricao.dart';

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

      void _abrirInscricao(title) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Inscricao(title: title),
          ),
        );
      }

      return SecompCard(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    e.edicao,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 4),
                    //   child: Icon(
                    //     Icons.calendar_today,
                    //     size: 18,
                    //     color: Colors.blueGrey,
                    //   ),
                    // ),
                    Text(
                      "Ano: ${e.ano}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 4),
                    //   child: Icon(
                    //     Icons.people,
                    //     size: 18,
                    //     color: Colors.blueGrey,
                    //   ),
                    // ),
                    Text(
                      "Inscritos: ${e.inscritos}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              children: <Widget>[
                if (e.ativo)
                  TextButton(
                    "Inscrever-se",
                    action: () => _abrirInscricao(e.edicao),
                    icon: Icon(
                      Icons.person_add,
                      size: 18,
                      color: Colors.green,
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  )
                else
                  TextButton(
                    "Informações",
                    action: () {},
                    icon: Icon(
                      Icons.info,
                      size: 18,
                      color: Colors.cyan,
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.cyan),
                  ),
              ],
            ),
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
