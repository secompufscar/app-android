import 'package:flutter/material.dart';

class DadosParticipante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        children: <Widget>[
          Center(
            child: Text(
              "Olá, <Participante>!",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Image.asset('assets/images/code.png'),
            ),
          ),
          Text(
            "DADOS DO EVENTO",
            style: TextStyle(fontSize: 20),
          ),
          Divider(),
          Text(
            "Pontuação COMPCases",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "1300",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 8,
          ),
          Text(
            "Tamanho da Camiseta",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "M Masculino",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 12,
          ),
          Text(
            "Restrição do Coffe Break",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Nenhuma",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      );
  }
}