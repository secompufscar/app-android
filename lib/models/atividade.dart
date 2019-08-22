import 'ministrante.dart';

enum Tipo { Palestra, Minicurso, Workshop, MesaRedonda, Coffee, Institucional }

class Atividade {
  final String tipo;
  final String titulo;
  final Ministrante ministrante;
  final DateTime inicio;
  final DateTime fim;
  final String local;
  final String descricao;

  Atividade(
      {this.tipo,
      this.titulo,
      this.ministrante,
      this.inicio,
      this.fim,
      this.local,
      this.descricao});

  factory Atividade.fromJson(Map<String, dynamic> json) {
    return Atividade(
      tipo: json['tipo'],
      titulo: json['titulo'],
      ministrante: Ministrante(json['ministrantes'][0], "Teste", "TEST"),
      local: json['local'],
      descricao: json['descricao'],
    );
  }
}
