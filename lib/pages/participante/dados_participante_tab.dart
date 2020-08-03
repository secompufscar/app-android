import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../bloc/participante/participante_bloc.dart';
import '../../models/participante.dart';
import '../pages.dart';

class DadosParticipanteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParticipanteBloc, ParticipanteState>(
      builder: (context, state) {
        if (state is ParticipanteLoadSuccess) {
          Participante participante = state.participante;

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
                    child: QrImage(size: 200, data: participante.id),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Atualizar"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
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
