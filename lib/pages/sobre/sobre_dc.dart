import 'package:flutter/material.dart';

class SobreDC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("O DC")),
        body: Container(
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Image.asset("assets/images/DC.jpg"),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "O Departamento de Computação existe desde 1972, sendo responsável por habilitar e colocar com excelência"
                    " anualmente no mercado de trabalho cerca de uma centena de profissionais, que atuam em empresas e em"
                    " Instituições de Ensino Superior.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "Atento à constante evolução na área de computação, o DC-UFSCar tem atuado na vanguarda do desenvolvimento"
                    " tecnológico, firmando-se no cenário nacional e internacional como um centro de pesquisa bastante atuante.",
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "Texto obtido da página institucional do Departamento de Computação da UFSCar, disponível em www.dc.ufscar.br.",
                    textAlign: TextAlign.justify,
                  )),
            ],
          )),
        ));
  }
}
