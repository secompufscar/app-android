import 'package:cloud_firestore/cloud_firestore.dart';

import 'ministrante.dart';

enum Tipo { Palestra, Minicurso, Workshop, MesaRedonda, Coffee, Institucional, Outro }

class Atividade{
  final Tipo tipo;
  final String titulo;
  List<Ministrante> ministrantes;
  final DateTime inicio;
  final DateTime fim;
  final String local;
  final String descricao;

  static DateTime getDate(String date) {
    print(date);
    return DateTime.parse(
          "2019-09-${date.substring(5, 7)} ${date.substring(17, 19)}:${date.substring(20, 22)}:00");
  }

  Atividade(
      {this.tipo,
      this.titulo,
      this.ministrantes,
      this.inicio,
      this.fim,
      this.local,
      this.descricao});

  factory Atividade.fromJson(Map<String, dynamic> json) {
    
    Tipo tipo;
    switch (json['tipo']) {
      case "Minicurso":
        tipo = Tipo.Minicurso;
        break;
      case "Palestra":
        tipo = Tipo.Palestra;
        break;
      case "Mesa Redonda":
        tipo = Tipo.MesaRedonda;
        break;
      default:
        tipo = Tipo.Outro;
    }

    if(json['titulo'] != null)
      if(json['titulo'].contains("Coffe")) 
        tipo = Tipo.Coffee;
    
    List<Ministrante> listMinistrantes = [];
    if (json['ministrantes'].length > 0) {
      for (var m in json['ministrantes']) {
        listMinistrantes.add(Ministrante(
            "${m['primeiro_nome']} ${m['sobrenome']}",
            m['cargo'] ?? "-",
            m['instituicao'] ?? "-",
            m['biografia'] ?? "-",
            m['img'] ?? "secomp.png"));
      }
    } else {
      listMinistrantes.add(Ministrante("SECOMP", "-", "-", "secomp.png", "Semana Acadêmica da Computação"));
    }

   

    return Atividade(
      tipo: tipo,
      titulo: json['titulo'] ?? json['tipo'] ?? "Atividade",
      ministrantes: listMinistrantes,
      local: json['local'] ?? " ",
      descricao: json['descricao'] ?? "Sem descrição",
      inicio: json['inicio'] != null ? getDate(json['inicio']) : null,
      fim: json['fim'] != null ? getDate(json['fim']) : null,
    );
  }

}


