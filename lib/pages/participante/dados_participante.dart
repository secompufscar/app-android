import 'package:app_secomp/components/text_button.dart';
import 'package:app_secomp/models/participante.dart';
import 'package:app_secomp/pages/login/login.dart';
import 'package:app_secomp/pages/participante/bloc_participante.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DadosParticipante extends StatelessWidget {
  final BlocParticipante bloc = BlocProvider.getBloc<BlocParticipante>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.outParticipante,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Participante participante = snapshot.data;

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            children: <Widget>[
              Center(
                child: Text(
                  "Olá, ${participante.nome}!",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Material(
                    child: QrImage(size: 200, data: participante.uuid),
                  ),
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
                participante.pontos.toString(),
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 8,
              ),
              Text(
                "Tamanho da Camiseta",
                style: TextStyle(fontSize: 16),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: participante.camisetas.length,
                itemBuilder: (context, index) => Text(
                  participante.camisetas[index],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 24,
              ),
              OutlineButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text("Atualizar Dados"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CamposLogin()));
                },
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
