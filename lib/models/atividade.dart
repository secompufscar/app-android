import 'ministrante.dart';

enum Tipo { Palestra, Minicurso, Workshop, MesaRedonda, Coffee, Institucional }

class Atividade {
  final Tipo tipo;
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
    // Mudar quando os nomes dos tipos estiverem certos no BD
    Tipo tipo;
    String tipoJson = json['tipo'];
    if (tipoJson == '1') {
      tipo = Tipo.Palestra;
    }

    return Atividade(
      tipo: tipo,
      titulo: json['titulo'],
      ministrante: Ministrante(json['ministrantes'][0], "Teste", "TEST"),
      local: json['local'],
      descricao: json['descricao'],
      inicio: DateTime(2019, 09, 10, 8, 0),
      fim: DateTime(2019, 09, 10, 9, 0),
    );
  }
}
