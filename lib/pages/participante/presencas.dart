import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/models/participante.dart';
import 'package:app_secomp/models/presenca.dart';
import 'package:app_secomp/pages/cronograma/bloc_cronograma.dart';
import 'package:app_secomp/pages/participante/bloc_participante.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class PresencasScreen extends StatelessWidget {
  final BlocParticipante bloc = BlocProvider.getBloc<BlocParticipante>();
  final BlocCronograma blocCronograma = BlocProvider.getBloc<BlocCronograma>();

  List<Presenca> presencas = <Presenca>[
    Presenca(
        atividade: Atividade(tipo: Tipo.Palestra, titulo: "Palestra legal"),
        horario: DateTime.now()),
    Presenca(
        atividade: Atividade(tipo: Tipo.Palestra, titulo: "Outra palestra"),
        horario: DateTime.now()),
    Presenca(
        atividade: Atividade(tipo: Tipo.Minicurso, titulo: "AFSAFASFasfsafnqs"),
        horario: DateTime.now()),
    Presenca(
        atividade: Atividade(tipo: Tipo.Palestra, titulo: "AGmdaomgasmgkas"),
        horario: DateTime.now()),
    Presenca(
        atividade: Atividade(tipo: Tipo.Workshop, titulo: "fsajofkaso k"),
        horario: DateTime.now()),
    Presenca(
        atividade: Atividade(tipo: Tipo.Palestra, titulo: "fkoakfos mkfsaji"),
        horario: DateTime.now()),
    Presenca(
        atividade: Atividade(tipo: Tipo.MesaRedonda, titulo: "opqwm knmwioqn "),
        horario: DateTime.now()),
  ];

  String getTipo(Tipo tipo) {
    switch (tipo) {
      case Tipo.Palestra:
        return "Palestra";
        break;
      case Tipo.Minicurso:
        return "Minicurso";
        break;
      case Tipo.Workshop:
        return "Workshop";
        break;
      case Tipo.MesaRedonda:
        return "Mesa-redonda";
        break;
      case Tipo.Coffee:
        return "Coffee-break";
        break;
      case Tipo.PS:
        return "Processo Seletivo";
        break;
      case Tipo.FeiraProjeto:
        return "Feira de Projetos";
        break;
      case Tipo.PalestraEmpresarial:
        return "Palestra Empresarial";
        break;
      default:
        return "Outro";
    }
  }

  Widget _buildItem(String presenca) {
    return ListTile(
      title: Text(presenca),
    );
  }

  @override
  Widget build(BuildContext context) {
    blocCronograma.fetchAtividades();
    return StreamBuilder(
      stream: bloc.outParticipante,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final Participante participante = snapshot.data;
          return ListView.builder(
            itemCount: participante.presencas.length,
            itemBuilder: (context, index) =>
                _buildItem(participante.presencas[index]),
          );
        } else {
          Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

// return ListView.builder(
//       itemCount: presencas.length,
//       itemBuilder: (context, index) => _buildItem(index),
//     );
