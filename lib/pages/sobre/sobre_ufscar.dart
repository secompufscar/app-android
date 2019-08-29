import 'package:flutter/material.dart';

class SobreUfscar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("A UFSCar")),
        body: Container(
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Image.asset("assets/images/Ufscar.jpg"),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "Fundada em 1968, a Universidade Federal de São Carlos (UFSCar), única instituição federal de Ensino Superior "
                    "localizada no interior do Estado de São Paulo, destaca-se pelo alto nível de qualificação de seu corpo docente:"
                    " 96,1% são doutores ou mestres. Em sua maioria, 98,6% dos professores desenvolvem atividades de ensino, pesquisa"
                    " e extensão em regime de dedicação exclusiva.",
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "A Universidade possui quatro campi, sendo que o principal fica em São Carlos, município localizado a 235 km"
                    " da capital do Estado, e tem 645 hectares de extensão, sendo 196 mil m² de área construída.",
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "O campus São Carlos possui 300 laboratórios, uma biblioteca, um ambulatório, dois teatros, nove anfiteatros,"
                    " 12 auditórios, um ginásio, um parque esportivo, sete quadras, duas piscinas, um restaurante universitário,"
                    " quatro lanchonetes, 124 salas de aula e 672 vagas internas e externas de moradia estudantil.",
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "Os 48 departamentos acadêmicos da Universidade estão divididos em oito centros: Ciências Agrárias, "
                    "Ciências Biológicas e da Saúde, Ciências em Gestão e Tecnologia, Ciências e Tecnologias para a Sustentabilidade,"
                    " Ciências Exatas e de Tecnologia, Ciências Humanas e Biológicas, Educação e Ciências Humanas e Ciências da"
                    " Natureza.",
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "A UFSCar oferece 62 cursos e um total de 2.757 vagas na graduação presencial. Além disso, conta com 47 "
                    "programas de pós-graduação, oito cursos de mestrado profissional, 41 de mestrado acadêmico, 27 de doutorado"
                    " e 95 cursos de especialização. No escopo da extensão, a UFSCar oferece 1355 atividades de extensão e 311 "
                    "programas. Oferece, também, 94 Atividades Curriculares de Integração (Aciepes).",
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "Há, no total, 24.825 alunos matriculados na Universidade: 12.338 de graduação presencial; 1.584 de educação "
                    "a distância; 369 são alunos de mestrado profissional; 1.915 de mestrado acadêmico; 1.690 de doutorado; e"
                    " 6.929 de especialização.",
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "Em 2014, a UFSCar obteve a 18ª colocação entre as 300 universidades da América Latina incluídas no ranking"
                    " elaborado pela Quacquarelli Symonds (QS). A instituição obteve 82 pontos na avaliação geral e é, portanto,"
                    " considerada a 10ª melhor instituição brasileira.",
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "Texto obtido da página institucional da UFSCar, disponível em www.ufscar.br.",
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Text(
                    "Créditos da imagem: Erick Radner, Revista UFSCar (edição n.º 01, Abril de 2017)."
                    " Disponível em http://revista.ufscar.br.",
                    textAlign: TextAlign.justify,
                  )),
            ],
          )),
        ));
  }
}
