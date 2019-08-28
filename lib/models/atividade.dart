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

    String nomeMinistrante;

    if(json['ministrantes'].length > 0) {
      nomeMinistrante = json['ministrantes'][0];
    } else {
      nomeMinistrante = " teste ";
    }

    return Atividade(
      tipo: tipo,
      titulo: json['titulo'],
      ministrante: Ministrante(nomeMinistrante, "Teste", "TEST"),
      local: json['local'],
      descricao: json['descricao'],
      inicio: DateTime.parse(json['inicio']),
      fim:  DateTime.parse(json['fim']),
    );
  }
}
