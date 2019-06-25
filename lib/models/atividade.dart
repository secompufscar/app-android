import 'ministrante.dart';

  enum Tipo {
    Palestra,
    Minicurso,
    Workshop,
    MesaRedonda,
    Coffee,
    Institucional
  }

class Atividade {

  final Tipo tipo;
  final String titulo;
  final Ministrante ministrante;
  final DateTime inicio;
  final DateTime fim;
  final String local;
  final String descricao;

  Atividade(this.tipo, this.titulo, this.ministrante, this.inicio, this.fim, this.local, this.descricao);
}