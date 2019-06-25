import 'ministrante.dart';

class Atividade {
  final String titulo;
  final Ministrante ministrante;
  final DateTime inicio;
  final DateTime fim;
  final String local;
  final String descricao;

  Atividade(this.titulo, this.ministrante, this.inicio, this.fim, this.local, this.descricao);
}