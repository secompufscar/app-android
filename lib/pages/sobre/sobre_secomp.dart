import 'package:flutter/material.dart';

class SobreSecomp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A Secomp")
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/Secomp.jpg"),
              Padding(
                padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Text(
                        "A Semana Acadêmica da Computação da Universidade Federal de São Carlos surgiu da necessidade de se trazer"
                        " assuntos que fossem de interesse tanto da comunidade acadêmica quanto de entusiastas. Nela, pessoas de"
                        " diferentes áreas são convidadas a apresentar, discutir e debater experiências e novidades que trarão" 
                        " informação, conhecimento e inovação aos participantes.",
                        textAlign: TextAlign.justify,
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Text(
                        "Desde a sua primeira edição, a SECOMP trabalha para que os assuntos sejam os mais atuais possíveis e que"
                        " sejam transmitidos da maneira mais dinâmica tentando aproximar o participante de áreas que vão da academia"
                        " até o mercado de trabalho através de minicursos, workshops, palestras técnicas, empresariais, mesas redondas,"
                        " feira de recrutamento e muitos outros conteúdos que foram pensados ao longo do tempo em busca de um evento"
                        " cada vez melhor.",
                        textAlign: TextAlign.justify,
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Text(
                        "Em prol disso, os estudos são constantes para que o modelo de evento sempre melhore e se torne referência,"
                        " trazendo cada vez mais experiências únicas a quem nos acompanha e encurtando as relações para que todos os"
                        " segmentos de público sejam beneficiados.",
                        textAlign: TextAlign.justify,
                )
              ),
            ],
          )
        ),
      )
    );
  }
}