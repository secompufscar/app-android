import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'participante.g.dart';

class ParticipanteOld {
  String nome;
  List camisetas;
  int pontos;
  List presencas;
  String uuid;

  ParticipanteOld(
      {this.nome, this.camisetas, this.pontos, this.presencas, this.uuid});
}

@JsonSerializable()
class Participante extends Equatable {
  Participante({
    this.id,
    this.primeiroNome,
    this.sobrenome,
    this.camisetas,
    this.presencas,
    this.pontos,
  });

  @JsonKey(name: 'uuid')
  final String id;

  @JsonKey(name: 'primeiro_nome')
  final String primeiroNome;

  final String sobrenome;

  @JsonKey(name: 'camiseta')
  final List<String> camisetas;

  final List<String> presencas;

  @JsonKey(name: 'pontuacao')
  final int pontos;

  get nome => '$primeiroNome $sobrenome';

  @override
  List<Object> get props =>
      [id, primeiroNome, sobrenome, camisetas, presencas, pontos];

  factory Participante.fromJson(Map<String, dynamic> json) =>
      _$ParticipanteFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipanteToJson(this);
}
