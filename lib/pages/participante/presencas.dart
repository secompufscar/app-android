import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/models/presenca.dart';
import 'package:flutter/material.dart';

class PresencasScreen extends StatelessWidget {
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
        return "Mesa Redonda";
        break;
      case Tipo.Coffee:
        return "Coffee Break";
        break;
      case Tipo.Institucional:
        return "Institucional";
        break;
      default:
        return "Atividade";
    }
  }

  Widget _buildItem(int index) {
    Presenca presenca = presencas[index];
    String tipo = getTipo(presenca.atividade.tipo);
    String titulo = presenca.atividade.titulo;
    return ListTile(
      title: Text("$tipo: $titulo"),
      subtitle: Text("${presenca.horario}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: presencas.length,
      itemBuilder: (context, index) => _buildItem(index),
    );
  }
}
